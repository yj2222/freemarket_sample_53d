class Product < ApplicationRecord
  has_many :likes
  has_many :images
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :category

  enum condition: {
    "新品、未使用": "新品、未使用", 
    "未使用に近い": "未使用に近い", 
    "目立った傷や汚れなし": "目立った傷や汚れなし", 
    "やや傷や汚れあり": "やや傷や汚れあり", 
    "傷や汚れあり": "傷や汚れあり", 
    "全体的に状態が悪い": "全体的に状態が悪い"}

  enum delivery_price: {
    '送料込み（出品者負担）': '送料込み（出品者負担）', 
    '送料込み（出品者負担）': '送料込み（出品者負担）', 
    '着払い（購入者負担）': '着払い（購入者負担）', 
    '着払い（購入者負担）': '着払い（購入者負担）'
  }

  enum delivery_day: {
    '1~2日で発送': '1~2日で発送', 
    '2〜3日で発送': '2〜3日で発送',
    '4〜7日で発送': '4〜7日で発送'
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

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :DESC) }
  # 取得するデータの数 = 4
  scope :limiter, -> { limit(4) }
  # limitとsortedを合わせたもの
  scope :recent, -> { sorted.limiter }

  validates :name,
    presence: { message: "入力してください" },
    length: { maximum: 40 }

  validates :description,
    presence: { message: "入力してください" },
    length: { maximum: 1000 }

  validates :category_id,
    numericality: { greater_than: 0, message: "選択して下さい" }

  validates :condition,
    presence: { message: "選択して下さい" }

  validates :delivery_price,
    presence: { message: "選択して下さい" }

  validates :prefecture,
    presence: { message: "選択して下さい" }

  validates :delivery_days,
    presence: { message: "選択して下さい" }
    
  validates :delivery_type,
    presence: { message: "選択して下さい" }

  # 現在では未実装
  # validates :status_id,
  #   presence: true

  validates :brand_id,
    length: { maximum: 40 }
  
  validates :user_id,
    presence: true

  validates :size_id,
    numericality: { greater_than: 0, message: "選択して下さい" }

    validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は300以上9,999,999以内で入力してください" }
end
