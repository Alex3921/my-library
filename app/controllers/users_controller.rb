class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: [:show]

  def new
    @user = User.new
  end

  def create
    byebug
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to library_path(@user.library), notice: 'Account created successfully!'
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
