class BadEventsController < ApplicationController
  before_action :set_bad_event, only: %i[edit update]
  before_action :has_bad_check, only: %i[new]

  def new
    @bad_event = BadEvent.new
  end

  def edit
  end

  def create
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event(bad_event_params)
    if @bad_event.valid?
      session[:bad_body] = @bad_event.body
      @prompts = Prompt.all.order(id: :asc)
    else
      flash.now[:danger] = t('defaults.message.failure', item: BadEvent.human_attribute_name(:body))
      render turbo_stream: turbo_stream.append('flashes', partial: "shared/flash_message"), status: :unprocessable_entity
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
    @memory = Memory.find(params[:id])
    @bad_event = @memory.bad_event
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
