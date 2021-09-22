class UsersController < ApplicationController
  include UsersHelper
  before_action :require_user_logged_in!, only: [:show, :edit, :update]

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
      flash.now[:alert] = @user.errors.full_messages[0]
      render :new
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    
    if @user.update(user_params.compact_blank!)
      redirect_to user_path(@user), notice: 'Account updated successfully!'
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
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
    params.require(:user).permit(:username, :email, :cover, :img_url, :password, :password_confirmation)
  end

end
