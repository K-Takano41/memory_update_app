module ImageApiMethod
  extend self

  def create_image(memory, prompt_text, column_name)

    headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer #{ENV["API_KEY"]}"
    }

    body = {
      "width": 512,
      "height": 512,
      "step": 50,
      "seed": 0,
      "cgf_scale": 7,
      "style_preset": "enhance",
      "text_prompts": [{
        "text": prompt_text,
        "weight": 1
      }]
    }

    response = Faraday.post(ENV["API_URL"]) do |res|
      res.headers = headers
      res.body = body.to_json
    end

    result = JSON.parse(response.body)
    image = result["artifacts"][0]["base64"]

    file = Tempfile.new(['img', '.png'])
    file.binmode
    file.write(Base64.decode64(image))
    file.rewind
    memory.send("#{column_name}=", file)
    memory.save
  end
end