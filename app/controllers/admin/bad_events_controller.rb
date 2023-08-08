class Admin::BadEventsController < Admin::BaseController
  before_action :set_bad_event, only: %i[edit update]

  def edit
  end

  def update
    if @bad_event.update(bad_event_params)
      redirect_to admin_memory_path(@memory), success: t('defaults.message.updated', item: BadEvent.human_attribute_name(:body))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: BadEvent.human_attribute_name(:body))
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def set_bad_event
    @memory = Memory.find(params[:id])
    @bad_event = @memory.bad_event
  end

  def bad_event_params
    params.require(:bad_event).permit(:body)
  end
end
