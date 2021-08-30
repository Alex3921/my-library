class FavoriteBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    user_fav = @current_user.favorite_books.find_by(book: @book)
    if user_fav
      FavoriteBook.delete(user_fav)
      redirect_to book_path(@book), alert: "#{@book.title} has been removed from favorites."
    else
      @current_user.favorite_books.build(book: @book)
      @current_user.save
      redirect_to book_path(@book), notice: "#{@book.title} has been added to favorites."
    end
  end

end