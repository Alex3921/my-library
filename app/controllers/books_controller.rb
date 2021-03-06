class BooksController < ApplicationController
  before_action :set_current_user
  include BooksHelper

  def index
    if params[:user_id]
      method_from_url = request.original_url.split('/').last
      @books = @current_user.send(method_from_url)
    else
      @books = Book.all[0..10]
    end
  end

  def show
    @book = Book.find(params[:id])
  end

end
