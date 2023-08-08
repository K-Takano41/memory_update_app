class ProfilesController < ApplicationController
  before_action :set_current_user, only: %i[edit update]
  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :email)
  end

  def set_current_user
    @user = User.find(current_user.id)
  end
end
