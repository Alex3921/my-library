module BooksHelper
  
  def favorite_icon(book)
    if logged_in? 
      @current_user.favorites.include?(book) ? "fas fa-star" : "far fa-star"
    else
      "far fa-star"
    end
  end

  def finished_icon(book)
    if logged_in?
      @current_user.finished.include?(book) ? "fas fa-book" : "far fa-book"
    else
      "far fa-book"
    end
  end

  def reading_now_icon(book)
    if logged_in?
      @current_user.reading_now.include?(book) ? "fas fa-book-open" : "far fa-book-open"
    else
      "far fa-book-open"
    end
  end

  def bucket_list_icon(book)
    if logged_in?
      @current_user.bucket_list.include?(book) ? "fas fa-list-alt" : "far fa-list-alt"
    else
      "far fa-list-alt"
    end
  end

  def favorite_count(book)
    "Favorited: #{pluralize(FavoriteBook.where(book_id: book.id).count, "time")}"
  end

  def finished_count(book)
    "Finished by: #{pluralize(FinishedBook.where(book_id: book.id).count, "person")}"
  end

  def reading_now_count(book)
    "Reading now: #{pluralize(ReadingNowBook.where(book_id: book.id).count, "person")}"
  end
end
