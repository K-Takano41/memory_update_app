class ImagesController < ApplicationController
  def generate
    @bad_event = BadEvent.find(params[:bad_event_id])
    @memory = @bad_event.memory
    @prompt = Prompt.find(params[:prompt_id])
    prompt_text = @prompt.bad_prompt

    ImageApiMethod.create_image(@memory, prompt_text, "bad_image")

    GenerateGoodImageJob.perform_later(@memory, @prompt)
    redirect_to memory_path(@memory)
  end
end
