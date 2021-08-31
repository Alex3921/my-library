class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    
    if user
      session[:user_id] = user.id
      redirect_to user_path(user),  notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: "Invalid credentials. Please try again!"
    end
  end

  def omniauth
    @current_user = User.from_omniauth(oauth_response)
    if @current_user.valid?
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user),  notice: 'Logged in successfully'
    else
      redirect_to login_path, alert: "Authentication failed. Please try again!"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Logged out successfully'
  end

  private
  def oauth_response
    request.env['omniauth.auth']
  end

end