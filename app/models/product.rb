class Product < ApplicationRecord
  has_many :likes
  has_many :images
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images

  enum condition: {
    "新品、未使用": 1, 
    "未使用に近い": 2, 
    "目立った傷や汚れなし": 3, 
    "やや傷や汚れあり": 4, 
    "傷や汚れあり": 5, 
    "全体的に状態が悪い": 6
  }

  enum size: {
    "XXS以下": "XXS以下",
    "XS(SS)": "XS(SS)",
    "S": "S",
    "M": "M",
    "L": "L",
    "XL(LL)": "XL(LL)",
    "2XL(3L)": "2XL(3L)",
    "3XL(4L)": "3XL(4L)",
    "4XL(5L)以上": "4XL(5L)以上",
    "FREE SIZE": "FREE SIZE"
  }

  enum delivery_price: {
    '送料込み（出品者負担）': '送料込み（出品者負担）', 
    '送料込み（出品者負担）': '送料込み（出品者負担）', 
    '着払い（購入者負担）': '着払い（購入者負担）', 
    '着払い（購入者負担）': '着払い（購入者負担）'
  }

  enum delivery_type: {
    "未定": "未定",
    "らくらくメルカリ便": "らくらくメルカリ便",
    "ゆうメール": "ゆうメール",
    "レターパック": "レターパック",
    "普通郵便(定形、定形外)": "普通郵便(定形、定形外)",
    "クロネコヤマト": "クロネコヤマト",
    "ゆうパック": "ゆうパック",
    "クリックポスト": "クリックポスト",
    "ゆうパケット": "ゆうパケット"
  }

  enum delivery_day: {
    '1~2日で発送': '1~2日で発送', 
    '2〜3日で発送': '2〜3日で発送',
    '4〜7日で発送': '4〜7日で発送'
  }

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :DESC) }
  # 取得するデータの数 = 4
  scope :limiter, -> { limit(4) }
  # limitとsortedを合わせたもの
  scope :recent, -> { sorted.limiter }

end
