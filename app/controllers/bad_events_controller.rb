class BadEventsController < ApplicationController
  before_action :set_bad_event, only: %i[show]
  def new
    @bad_event = BadEvent.new
  end

  def create
    @memory = current_user.memories.build
    @bad_event = @memory.bad_events.build(bad_event_params)
    if @memory.save
      flash.now[:success] = t('.success')
      # render turbo_stream: turbo_stream.replace('modal', partial: "shared/modal")
    else
      flash.now[:danger] = t('.danger')
      render turbo_stream: turbo_stream.append('flashes', partial: "shared/flash_message"), status: :unprocessable_entity
    end
  end

  def show
    @memory = @bad_event.memory
  end

  def edit
  end

  def update
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
end
