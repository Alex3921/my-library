class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    
    if @user
      session[:user_id] = @user.id
      redirect_to about_path
    else
      flash[:message] = "Invalid credentials. Please try again!"
      redirect_to login_path
    end
  end

  def omniauth

  end

  def destroy
    reset_session
    redirect_to login_path
  end

end