class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: t('defaults.login_success')
    else
      flash.now[:danger] = t('defaults.login_failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('defaults.logout_success'), status: :see_other
  end
end
