class LikesController < ApplicationController
  before_action :require_user_logged_in!
  include LikesHelper

  def create
    @book = Book.find(params[:book_id])
    @opinion = Opinion.find(params[:opinion_id])
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
