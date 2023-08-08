class TwitterSessionsController < ApplicationController
  skip_before_action :require_login
  def create
    @user = User.find_or_create_form_auth(auth_hash)
    if User.exists?(email: @user.email)
      reset_session
      auto_login(@user)
      redirect_to root_path, success: t('defaults.message.login_success')
    else
      redirect_to new_user_path, danger: t('defaults.message.login_failure')
    end
  end

  def failure
    redirect_to root_path, danger: t('defaults.message.login_failure')
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
