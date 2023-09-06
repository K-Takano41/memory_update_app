class Admin::PromptsController < Admin::BaseController
  before_action :set_prompt, only: %i[show edit update destroy]
  def index
    @prompts = Prompt.all.order(id: :asc).page(params[:page])
  end

  def show
  end

  def new
    @prompt = Prompt.new
  end

  def edit
  end

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      redirect_to admin_prompts_path, success: t('defaults.message.created', item: Prompt.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.failure', item: Prompt.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @prompt.update(prompt_params)
      redirect_to admin_prompt_path, success: t('defaults.message.updated', item: Prompt.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Prompt.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prompt.destroy
    redirect_to admin_prompts_path, success: t('defaults.message.deleted', item: Prompt.model_name.human), status: :see_other
  end

  private

  def prompt_params
    params.require(:prompt).permit(:question, :bad_prompt, :good_prompt, :bad_negative_prompt, :good_negative_prompt)
  end

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end
end
