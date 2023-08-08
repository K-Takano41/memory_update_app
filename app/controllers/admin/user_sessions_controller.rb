class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]
  layout 'admin_login'
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_path, success: t('defaults.message.login_success')
    else
      flash.now[:danger] = t('defaults.message.login_failure')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: t('defaults.message.logout_success')
  end
end
