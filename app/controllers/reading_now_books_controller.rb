class ReadingNowBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    user_reading = @current_user.reading_now_books.find_by(book: @book)
    if user_reading
      ReadingNowBook.delete(user_reading)
      redirect_to book_path(@book), alert: "#{@book.title} has been removed from the list."
    else
      @current_user.reading_now_books.build(book: @book)
      @current_user.save
      redirect_to book_path(@book), notice: "You're currently reading #{@book.title}."
    end
  end
end