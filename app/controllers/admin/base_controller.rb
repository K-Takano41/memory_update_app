class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    flash[:warning] = t('defaults.message.login_message')
    redirect_to admin_login_path
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, warning: t('defaults.message.not_authorized')
    end
  end
end
