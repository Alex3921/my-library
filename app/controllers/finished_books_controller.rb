class FinishedBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    user_fin = @current_user.finished_books.find_by(book: @book)
    if user_fin
      FinishedBook.delete(user_fin)
      redirect_to book_path(params[:book_id]), alert: "#{@book.title} has been removed from your finished books."
    else
      @current_user.finished_books.build(book: @book)
      @current_user.save
      redirect_to book_path(@book), notice: "#{@book.title} has been added to your finished books."
    end
  end
end