class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[show status_change check_image_status owner_only]
  before_action :owner_only, only: %i[show status_change]
  
  def user_memories
    @memories = current_user.memories.good
  end
  
  def show
    @good_events = @memory.good_events
    if @memory.bad?
      render 'bad_show'
    else
      render 'good_show'
    end
  end

  def status_change
    @memory.good!
    redirect_to memory_path, success: t('.message')
  end

  def check_image_status
    if @memory.bad_image.present?
      render json: { status: "complete", image_url: @memory.bad_image.url }
    else
      render json: { status: "incomplete" }
    end
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def owner_only
    unless @memory.user == current_user
      redirect_to memories_path, warning: t('defaults.message.not_view')
    end
  end
end
