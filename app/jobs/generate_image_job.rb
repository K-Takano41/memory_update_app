class GenerateImageJob < ApplicationJob
  queue_as :default

  rescue_from StandardError do |exception|
    logger.error("GenerateImageJobでエラーが発生しました: #{exception.message}")
  end

  def perform(prompt_text, negative_text, memory, column_name)
    headers = {
      Accept: "application/json", 'Content-Type': "application/json", Authorization: "Bearer #{ENV.fetch('API_KEY', nil)}"
    }

    body = {
      steps: 30,
      width: 1024,
      height: 1024,
      seed: 0,
      cfg_scale: 5,
      samples: 1,
      text_prompts: [
        {
          text: prompt_text,
          weight: 1
        },
        {
          text: negative_text,
          weight: -1
        }
      ]
    }

    response = Faraday.post(ENV.fetch('API_URL', nil)) do |res|
      res.headers = headers
      res.body = body.to_json
    end

    raise StandardError, "APIエラー。ステータスコード: #{response.status}" unless response.status == 200

    result = JSON.parse(response.body)
    image = result["artifacts"][0]["base64"]
    file = Tempfile.new(['img', '.png'])
    file.binmode
    file.write(Base64.decode64(image))
    file.rewind

    memory.send("#{column_name}=", file)

    memory.image_composite if column_name == "good_image"

    memory.save
  end
end
