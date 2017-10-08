class SessionsController < ApplicationController
  # def new # <-- typical way; uses url /sessions/new
  def login # <-- new way; uses url /register
  end

  def create
    user = User.find_by(email: params[:email])
    if !!user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/entries"
    else
      @error = true
      render "/sessions/new"
    end
  end

  def delete
    reset_session
    redirect_to "/entries"
  end
end
