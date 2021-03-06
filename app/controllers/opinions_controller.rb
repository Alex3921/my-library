class OpinionsController < ApplicationController
  before_action :require_user_logged_in!

  def create
    @book = Book.find(params[:book_id])
    @book.opinions.build(opinion_params).user = @current_user 
    if @book.save
      flash[:notice] = "Comment added successfully!"
    else
      flash[:alert] = "There was an error. Please try again!"
    end
    
    redirect_to book_path(@book)
  end

  def edit
    @opinion = Opinion.find(params[:id])
    @book = @opinion.book
  end

  def update
    @opinion = Opinion.find(params[:id])
    @book = @opinion.book
    
    if @opinion.update(opinion_params)
      redirect_to book_path(@book), notice: 'Comment updated successfully!'
    else
      flash.now[:alert] = @opinion.errors.full_messages[0]
      render 'opinions/edit'
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @book = @opinion.book
    @opinion.destroy
    redirect_to book_path(@book), notice: "Comment removed!"
  end

  private
  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
