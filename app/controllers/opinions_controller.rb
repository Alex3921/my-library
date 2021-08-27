class OpinionsController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    @book.opinions.build(opinion_params).user = @current_user 
    if @book.save
      flash[:notice] = "Opinion added successfully!"
    else
      flash[:alert] = "There was an error. Please try again!"
    end
    
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:book_id])
    @opinion = Opinion.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @opinion = Opinion.find(params[:id])
    
    if @opinion.update(opinion_params)
      redirect_to book_path(@book)
    else
      render 'books/edit'
    end
  end

  def destroy
    Opinion.destroy(params[:id])
    redirect_to book_path(params[:book_id])
  end

  private
  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
