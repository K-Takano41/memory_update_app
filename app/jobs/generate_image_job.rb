class GenerateImageJob < ApplicationJob
  queue_as :default

  rescue_from StandardError do |exception|
    logger.error("GenerateImageJobでエラーが発生しました: #{exception.message}")
  end

  def perform(prompt_text, negative_text, memory, column_name)
    headers = {
      Accept: "application/json", 'Content-Type': "application/json", Authorization: "Bearer #{ENV.fetch('API_KEY')}"
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

    response = Faraday.post(ENV.fetch('API_URL')) do |res|
      res.headers = headers
      res.body = body.to_json
    end

    if response.status == 200
      result = JSON.parse(response.body)
      image = result["artifacts"][0]["base64"]
      file = Tempfile.new(['img', '.png'])
      file.binmode
      file.write(Base64.decode64(image))
      file.rewind

      memory.send("#{column_name}=", file)
      memory.save

      return unless column_name == "good_image"

      memory.image_composite
    else
      logger.error("GenerateImageJobでAPIからエラーのレスポンスが返されました。ステータスコード: #{response.status}")
    end
  end
end
