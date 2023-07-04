class BadEventsController < ApplicationController
  def new
    @bad_event = BadEvent.new
  end

  def create
    @memory = current_user.memories.build
    @bad_event = @memory.bad_events.build(bad_event_params)
    if @memory.save
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bad_event_params
    params.require(:bad_event).permit(:body)
  end
end
