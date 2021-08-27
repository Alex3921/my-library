class Book < ApplicationRecord
  belongs_to :author
  has_many :opinions, dependent: :destroy
end
