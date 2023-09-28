class ProfilesController < ApplicationController
  before_action :set_current_user, only: %i[edit update]
  before_action :check_not_guest, only: %i[show edit]
  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to profiles_path, success: t('defaults.message.updated', item: User.model_name.human)
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

  def check_not_guest
    return unless current_user.guest?

    redirect_to root_path, danger: t('profiles.check_not_guest.danger')
  end
end
