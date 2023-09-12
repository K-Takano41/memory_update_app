class ImagesController < ApplicationController
  def generate

    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event
    @bad_event.body = session[:bad_body]
    session[:bad_body] = ""
    @prompt = Prompt.find(params[:prompt_id])
    prompt_text = @prompt.bad_prompt
    negative_text = @prompt.bad_negative_prompt
    
    ImageApiMethod.create_image(prompt_text, negative_text, @memory, "bad_image") 
    
    if @memory.save
      GenerateGoodImageJob.perform_later(@memory, @prompt)
      redirect_to memory_path(@memory), success: t('.success')
    else
      redirect_to new_bad_event_path, danger: t('.danger')
    end

  end
end
