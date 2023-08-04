class BadEventsController < ApplicationController
  before_action :set_bad_event, only: %i[edit update]
  before_action :has_bad_check, only: %i[create]
  def new
    @bad_event = BadEvent.new
  end

  def create
    @memory = current_user.memories.build
    @bad_event = @memory.build_bad_event(bad_event_params)
    if @memory.save
      flash.now[:success] = t('defaults.event_success')
      # render turbo_stream: turbo_stream.replace('modal', partial: "shared/modal")
    else
      flash.now[:danger] = t('defaults.event_danger')
      render turbo_stream: turbo_stream.append('flashes', partial: "shared/flash_message"), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bad_event.update(bad_event_params)
    flash.now[:success] = "更新しました"
    else
      flash.now[:danger] = "更新できませんでした"
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
      memory = current_user.memories.bad.first
      redirect_to memory_path(memory), warning: "入力途中のエピソードがあります"
    end
  end
end
