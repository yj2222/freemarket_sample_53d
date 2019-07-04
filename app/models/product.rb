class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :images
  accepts_nested_attributes_for :images

  # enum condition: [:"---", :unused , :like_new , :invisibly_damaged , :slightly_damaged , :damaged , :bad ]
  enum condition: {"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}

end
