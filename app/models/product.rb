class Product < ApplicationRecord
  has_many :likes
  has_many :images
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images

  # enum condition: [:"---", :unused , :like_new , :invisibly_damaged , :slightly_damaged , :damaged , :bad ]
  enum condition: {"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :DESC) }
  # 取得するデータの数 = 4
  scope :limit, -> { limit(4) }
  # limitとsortedを合わせたもの
  scope :recent, -> { sorted.limit }

end
