class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username, message: 'An account associated with %{value} already exists'

  has_many :favorite_books
  has_many :favorites, through: :favorite_books, source: :book
  has_many :finished_books
  has_many :finished, through: :finished_books, source: :book
  has_many :bucket_list_books
  has_many :bucket_list, through: :bucket_list_books, source: :book
  has_many :reading_now_books
  has_many :reading_now, through: :reading_now_books, source: :book

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response['uid'], provider: response['provider']) do |u|
      u.email = response['info']['email']
      u.username = response['info']['name']
      u.password = SecureRandom.hex(15)
      u.img_url = response['info']['image']
    end
  end
end