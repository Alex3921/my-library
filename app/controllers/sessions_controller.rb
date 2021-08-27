class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    
    if user
      session[:user_id] = user.id
      redirect_to user_path(user),  notice: 'Logged in successfully'
    else
      flash[:alert] = "Invalid credentials. Please try again!"
      redirect_to login_path
    end
  end

  def omniauth
    user = User.from_omniauth(oauth_response)

    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user),  notice: 'Logged in successfully'
    else
      flash[:alert] = "Invalid credentials. Please try again!"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private
  def oauth_response
    request.env['omniauth.auth']
  end

end