class FinishedBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    user_fin = @current_user.finished_books.find_by(book_id: params[:book_id])
    if user_fin
      FinishedBook.delete(user_fin)
      redirect_to book_path(params[:book_id])
    else
      @current_user.finished_books.build(book_id: params[:book_id])
      @current_user.save
      redirect_to book_path(params[:book_id])
    end
  end
end