class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new confirm create]
  before_action :set_user, only: %i[destroy]
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    return if @user.valid?

    render :new, status: :unprocessable_entity
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

  def destroy
    @user.destroy
    redirect_to root_path, success: t('.success'), status: :see_other
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
