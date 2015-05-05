class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def new
    cant_register_after_login

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your profile has been created!"
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "That action is not allowed"
      redirect_to categories_path
    end
  end

  def cant_register_after_login
    if logged_in?
      flash[:danger] = "You are all ready registered"
      redirect_to categories_path
    end
  end
end