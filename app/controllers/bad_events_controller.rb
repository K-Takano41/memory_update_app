class BadEventsController < ApplicationController
  before_action :set_bad_event, only: %i[edit update]
  before_action :has_bad_check, only: %i[new]

  def new
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event
  end

  def edit
  end

  def confirm
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event(bad_event_params)
    if @bad_event.valid? && @memory.valid?(:guest_memory_count_check)
      session[:bad_body] = @bad_event.body
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event(bad_event_params)
    if params[:back]
      render :new, status: :ok
    else
      @prompts = Prompt.all.order(id: :asc)
      render turbo_stream: turbo_stream.replace("modal", partial: "shared/modal", locals: { bad_event: @bad_event, prompts: @prompts }), status: :ok
    end
  end

  def update
    if @bad_event.update(bad_event_params)
    flash.now[:success] = t('defaults.message.updated', item: BadEvent.human_attribute_name(:body))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: BadEvent.human_attribute_name(:body))
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_bad_event
    @bad_event = BadEvent.find(params[:id])
  end

  def bad_event_params
    params.require(:bad_event).permit(:body)
  end

  def has_bad_check
    if current_user.memories.bad.exists?
      @memory = current_user.memories.bad.first
      redirect_to memory_path(@memory), warning: t('.message.create_wait')
    end
  end
end
