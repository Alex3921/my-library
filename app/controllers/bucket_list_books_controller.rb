class BucketListBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    user_bucket = @current_user.bucket_list_books.find_by(book: @book)
    if user_bucket
      BucketListBook.delete(user_bucket)
      redirect_to book_path(@book), alert: "#{@book.title} has been removed from your bucket list."
    else
      @current_user.bucket_list_books.build(book: @book)
      @current_user.save
      redirect_to book_path(@book), notice: "#{@book.title} has been added to your bucket list."
    end
  end
end