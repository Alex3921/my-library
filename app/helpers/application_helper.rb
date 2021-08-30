module ApplicationHelper
  def set_current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!set_current_user
  end

  def require_user_logged_in!
    redirect_to login_path, alert: 'You must be signed in!' if !logged_in?
  end

  def record_not_found!
    if logged_in?
      redirect_to books_path, alert: 'Record not found!'
    else
      redirect_to login_path, alert: 'Record not found!'
    end
  end
end
