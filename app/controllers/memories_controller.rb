class MemoriesController < ApplicationController
  def image
    @bad_event = BadEvent.find(params[:id])
    @memory = @bad_event.memory
    prompt = ENV['IMAGE_PROMPT']
    connect = Faraday.new(
      url: "https://api.rinna.co.jp/models/tti/v2",
      headers: {'Content-Type' => 'application/json', 
        'Cache-Control' => 'no-cache', 
        'Ocp-Apim-Subscription-Key' => ENV['IMAGE_API_KEY']} )
    response = connect.post('', { prompts: prompt, scale: 7.5 }.to_json )
    result = JSON.parse(response.body)
    @memory.bad_image = result["image"]
    @memory.save
    GenerateGoodImageJob.perform_later(@memory.id)
  end
end
