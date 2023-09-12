class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[show status_change owner_only]
  before_action :owner_only, only: %i[show status_change]
  skip_before_action :require_login, only: %i[index]
  
  def index
    @memories = Memory.good.includes(:user).page(params[:page])
  end
  
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
