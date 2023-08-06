class MemoriesController < ApplicationController
  before_action :set_memory, only: %i[show page_change owner_only]
  before_action :owner_only, only: %i[show page_change]
  skip_before_action :require_login, only: %i[index]
  
  def index
    @memories = Memory.good.page(params[:page])
    render layout: "application"
  end
  
  def user_memories
    @memories = current_user.memories.good
  end
  
  def show
    if @memory.good? && @memory.good_events.count < 5 # 削除を想定してないので本来不要
      @memory.bad!
    end
  end

  def page_change
    if @memory.bad? && @memory.good_events.count == 5 # 削除を想定してないのでifは本来不要
      @memory.good!
      image_composite(@memory)
      redirect_to memory_path
    end
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def owner_only
    unless @memory.user == current_user
      redirect_to memories_path, warning: t('defaults.not_view')
    end
  end
end
