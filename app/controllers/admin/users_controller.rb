class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, success: t('defaults.message.created', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.failure', item: User.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, success: t('defaults.message.deleted', item: User.model_name.human), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
