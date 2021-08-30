module UsersHelper

  def user_is_allowed?
    if session[:user_id] != params[:user_id]
      render :show, alert: "Access denied!"
    end
  end
end
