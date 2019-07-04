class Product < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :images
  belongs_to :category

  
end
