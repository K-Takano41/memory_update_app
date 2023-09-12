module ImageApiMethod
  extend self

  def create_image(prompt_text, negative_text, memory, column_name)
    
    headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer #{ENV["API_KEY"]}"
    }

    body = {
      "steps": 30,
      "width": 1024,
      "height": 1024,
      "seed": 0,
      "cfg_scale": 5,
      "samples": 1,
      "text_prompts": [
        {
          "text": prompt_text,
          "weight": 1
        },
        {
          "text": negative_text,
          "weight": -1
        }
      ]
    }

    response = Faraday.post(ENV["API_URL"]) do |res|
      res.headers = headers
      res.body = body.to_json
    end

    if response.status != 200
      return
    end

    result = JSON.parse(response.body)
    image = result["artifacts"][0]["base64"]

    file = Tempfile.new(['img', '.png'])
    file.binmode
    file.write(Base64.decode64(image))
    file.rewind

    memory.send("#{column_name}=", file)
  end
end