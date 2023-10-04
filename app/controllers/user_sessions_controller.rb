class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def guest_login
    uuid = Faker::Internet.uuid
    guest_user = User.guest_account(uuid)
    auto_login(guest_user)
    redirect_to root_path, success: t('.success')
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success'), status: :see_other
  end
end
