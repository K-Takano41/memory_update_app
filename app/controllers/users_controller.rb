class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new confirm create]
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    if @user.invalid?
      flash.now[:danger] = t('.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if params[:back] || !@user.save
      render :new, status: :ok
    else
      auto_login(@user)
      redirect_to root_path, success: t('.success')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end