class ReadingNowBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    user_reading = @current_user.reading_now_books.find_by(book_id: params[:book_id])
    if user_reading
      ReadingNowBook.delete(user_reading)
      redirect_to book_path(params[:book_id])
    else
      @current_user.reading_now_books.build(book_id: params[:book_id])
      @current_user.save
      redirect_to book_path(params[:book_id])
    end
  end
end