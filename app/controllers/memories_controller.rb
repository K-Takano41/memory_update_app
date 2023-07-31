class MemoriesController < ApplicationController
  layout 'sidebar_layout'
  before_action :set_memory, only: %i[show page]
  def show
    if @memory.after? && @memory.good_events.count < 5
      @memory.before!
    end
  end

  def page
    if @memory.before? && @memory.good_events.count == 5
      @memory.after!
    end
    redirect_to memory_path
  end

  private
  def set_memory
    @memory = Memory.find(params[:id])
  end
end
