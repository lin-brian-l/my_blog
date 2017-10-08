class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @welcome = "You have successfully registered your account! Please log in!"
      render "sessions/new"
    else
      @errors = @user.errors.full_messages
      render "users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
