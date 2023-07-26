class ImagesController < ApplicationController
  def generate
    @bad_event = BadEvent.find(params[:bad_event_id])
    @memory = @bad_event.memory
    @prompt = Prompt.find(params[:prompt_id])
    @memory.bad_image = "bad_image/#{@prompt.bad_prompt}"
    @memory.save
    GenerateGoodImageJob.perform_later(@memory.id, @prompt.id)
    redirect_to memory_path(@memory)
  end
end
