class MemoriesController < ApplicationController
  def image
    @bad_event = BadEvent.find(params[:id])
    @memory = @bad_event.memory
    @prompt = Prompt.find(params[:prompt_id])
    @memory.bad_image = "bad_image/#{@prompt.bad_prompt}"
    @memory.save
    GenerateGoodImageJob.perform_later(@memory.id, @prompt.id)
    redirect_to bad_event_path
  end
end
