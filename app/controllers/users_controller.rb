class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
