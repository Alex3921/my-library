class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :likes

  validates_presence_of :content
end
