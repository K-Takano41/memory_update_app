class ImagesController < ApplicationController
  def generate

    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event
    @bad_event.body = session[:bad_body]
    session[:bad_body].clear
    @prompt = Prompt.find(params[:prompt_id])
    prompt_text = @prompt.bad_prompt
    negative_text = @prompt.bad_negative_prompt

    @memory.bad_image = ImageApiMethod.create_image(prompt_text, negative_text)

    if @memory.save
      GenerateGoodImageJob.perform_later(@memory, @prompt)
      redirect_to memory_path(@memory), success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render 'bad_events/new', status: :unprocessable_entity
    end

  end
end
