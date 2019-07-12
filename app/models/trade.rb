class Trade < ApplicationRecord
  belongs_to :product
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
end