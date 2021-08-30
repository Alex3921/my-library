class UsersController < ApplicationController
  include UsersHelper
  before_action :require_user_logged_in!, only: [:show, :edit, :update]
  before_action :user_is_allowed?, only: [:show, :edit, :update]

  def show
    @current_user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Account created successfully!'
    else
      render :new, flash.now[:alert] = "There was an error. Please try again!"
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    byebug
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Account updated successfully!'
    else
      render :edit, flash.now[:alert] = "There was an error. Please try again!"
    end
  end

  def destroy
    @user = User.find(session[:user_id])

    @user.destroy
    reset_session
    redirect_to login_path, notice: "User was successfully destroyed!"
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :img_url, :password, :password_confirmation)
  end

end
