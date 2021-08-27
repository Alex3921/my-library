class BucketListBooksController < ApplicationController
  before_action :require_user_logged_in!

  def create
    user_bucket = @current_user.bucket_list_books.find_by(book_id: params[:book_id])
    if user_bucket
      BucketListBook.delete(user_bucket)
      redirect_to book_path(params[:book_id])
    else
      @current_user.bucket_list_books.build(book_id: params[:book_id])
      @current_user.save
      redirect_to book_path(params[:book_id])
    end
  end
end