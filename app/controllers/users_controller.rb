class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:danger] = "Not registration!"
      render :new
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end
  helper_method :user

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
