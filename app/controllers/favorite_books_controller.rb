class FavoriteBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    user_fav = @current_user.favorite_books.find_by(book_id: params[:book_id])
    if user_fav
      FavoriteBook.delete(user_fav)
      redirect_to book_path(params[:book_id])
    else
      @current_user.favorite_books.build(book_id: params[:book_id])
      @current_user.save
      redirect_to book_path(params[:book_id])
    end
  end

end