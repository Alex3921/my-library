class User < ApplicationRecord
  has_many :favorite_books
  has_many :books_favorite, through: :favorite_books, source: :book
  has_many :finished_books
  has_many :books_finished, through: :finished_books, source: :book
  has_many :bucket_list_books
  has_many :books_bucket_list, through: :bucket_list_books, source: :book
  has_many :reading_now_books
  has_many :books_reading_now, through: :reading_now_books, source: :book
  has_many :libraries
  has_many :library_books, through: :libraries, source: :book
  has_many :opinions
end
