module LikesHelper
  def like_icon(opinion)
    if logged_in? 
      if opinion.likes.find_by(user: @current_user)
        (content_tag(:i, "", class:"fas fa-heart m-2") + "Dislike")
      else
        (content_tag(:i, "", class:"far fa-heart m-2") + "Like")
      end
    else
      "far fa-heart"
    end
  end

  def likes_count(opinion)
    "#{pluralize(Like.where(opinion: opinion).count, "like")}"
  end
end
