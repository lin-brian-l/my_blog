class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if !@user.nil? && !!@user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/entries"
    else
      @user = User.new(email: params[:email])
      @error = true
      render "/sessions/new"
    end
  end

  def delete
    reset_session
    redirect_to "/entries"
  end
end
