class Trade < ApplicationRecord
  belongs_to :product
  belongs_to :seller_id, class_name: "User"
  belongs_to :buyer_id, class_name: "User"
end