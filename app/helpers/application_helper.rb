module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user!
    redirect_to login_path if !logged_in?
  end
end
