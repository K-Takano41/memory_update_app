class GenerateGoodImageJob < ApplicationJob
  queue_as :default

  def perform(id)
    memory = Memory.find(id)
    prompt = ENV['ANOTHER_PROMPT']
    connect = Faraday.new(
      url: "https://api.rinna.co.jp/models/tti/v2",
      headers: {'Content-Type' => 'application/json', 
        'Cache-Control' => 'no-cache', 
        'Ocp-Apim-Subscription-Key' => ENV['IMAGE_API_KEY']} )
    response = connect.post('', { prompts: prompt, scale: 7.5 }.to_json )
    result = JSON.parse(response.body)
    memory.good_image = result["image"]
    memory.save
  end
end
