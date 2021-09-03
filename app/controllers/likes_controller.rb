class LikesController < ApplicationController
  before_action :require_user_logged_in!
  include LikesHelper

  def create
    @opinion = Opinion.find(params[:opinion_id])
    @book = @opinion.book
    like = @opinion.likes.find_by(user: @current_user)
    if !!like
      Like.delete(like)
      redirect_to book_path(@book)
    else
      @opinion.likes.build(user: @current_user )
      @opinion.save
      redirect_to book_path(@book)
    end
  end
end
