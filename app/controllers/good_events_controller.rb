class GoodEventsController < ApplicationController
  before_action :set_good_event, only: %i[show edit update owner_only]
  before_action :owner_only, only: %i[show edit]
  def new
    @good_event = GoodEvent.new
    @memory = Memory.find(params[:memory_id])
  end

  def create
    @memory = Memory.find(params[:memory_id])
    @good_event = @memory.good_events.build(good_event_params)
    if @good_event.save
      redirect_to memory_path(@memory), success: t('defaults.message.created', item: GoodEvent.human_attribute_name(:body))
    else
      flash.now[:danger] = t('defaults.message.failure', item: GoodEvent.human_attribute_name(:body))
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @good_event.update(good_event_params)
      redirect_to good_event_path, success: t('defaults.message.updated', item: GoodEvent.human_attribute_name(:body))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: GoodEvent.human_attribute_name(:body))
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def good_event_params
    params.require(:good_event).permit(:title, :body, :date)
  end

  def set_good_event
    @good_event = GoodEvent.find(params[:id])
  end

  def owner_only
    unless @good_event.memory.user == current_user
      redirect_to user_memories_memories_path, warning: t('defaults.message.not_view')
    end
  end
end
