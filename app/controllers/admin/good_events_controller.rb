class Admin::GoodEventsController < Admin::BaseController
  before_action :set_good_event, only: %i[edit update]
  def edit
  end

  def update
    if @good_event.update(good_event_params)
      redirect_to admin_memory_path(@good_event.memory), success: t('defaults.message.updated', item: GoodEvent.human_attribute_name(:body))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: GoodEvent.human_attribute_name(:body))
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def set_good_event
    @good_event = GoodEvent.find(params[:id])
  end

  def good_event_params
    params.require(:good_event).permit(:title, :body)
  end
end
