module UsersHelper
  def user_cover
    @current_user.img_url.blank? ? @current_user.cover : @current_user.img_url
  end
end
