class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged In!"
      redirect_to categories_path
    else
      flash[:danger] = "There was a problem with your username or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
  end

end
