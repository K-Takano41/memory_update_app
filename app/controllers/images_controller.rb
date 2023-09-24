class ImagesController < ApplicationController
  def generate
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event
    @bad_event.body = session[:bad_body]
    session[:bad_body] = ""
    @prompt = Prompt.find(params[:prompt_id])
    
    if @memory.save
      GenerateImageJob.perform_later(@prompt.bad_prompt, @prompt.bad_negative_prompt, @memory, "bad_image") 
      GenerateImageJob.perform_later(@prompt.good_prompt, @prompt.good_negative_prompt, @memory, "good_image")
      redirect_to memory_path(@memory), success: t('.success')
    else
      redirect_to new_bad_event_path, danger: t('.danger')
    end
  end
end
