class MemoriesController < ApplicationController
  layout 'sidebar_layout'
  before_action :set_memory, only: %i[show]
  def show
    @bad_event = @memory.bad_event
  end

  private
  def set_memory
    @memory = Memory.find(params[:id])
  end
end
