class Admin::MemoriesController < Admin::BaseController
  before_action :set_memory, only: %i[show destroy]
  def index
    @memories = Memory.all.includes(:user).order(id: :desc).page(params[:page])
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def destroy
    @memory.destroy
    redirect_to admin_memories_path, success: t('defaults.message.deleted', item: Memory.model_name.human), status: :see_other
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end
end
