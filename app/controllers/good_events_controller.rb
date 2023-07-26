class GoodEventsController < ApplicationController
  layout 'sidebar_layout'
  before_action :set_good_event, only: %i[show edit update]
  def new
    @good_event = GoodEvent.new
    @memory = Memory.find(params[:memory_id])
  end

  def create
    @memory = Memory.find(params[:memory_id])
    @good_event = @memory.good_events.build(good_event_params)
    if @good_event.save
      redirect_to memory_path(@memory), success: t('defaults.event_success')
    else
      flash.now[:danger] = t('defaults.event_danger')
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @good_event.update(good_event_params)
      redirect_to good_event_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
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
end
