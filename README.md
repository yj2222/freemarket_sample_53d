## DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|passward|string|null: false|
|firstname_kanji|string|null: false|
|lastname_kanji|string|null: false|
|firstname_katakana|string|null: false|
|lastname_katakana|string|null: false|
|birth_yaer|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|post_number|intger|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building|string|
|phone_number|intger|
|card_id|references|null: false|

### Association
- has_many :products
- has_many :likes



## creditsテーブル
|user_id|references|null: false, index: true, foreign_key: true|
|number|intger|null: false|
|month|intger|null: false|
|year|intger|null: false|
|security_code|intger|null: false|

### Association
- belongs_to :user



## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, index: true, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category_id|references|null: false,foreign_key: true|
|size|string|null: false|
|brand|string|
|condition|string|null: false|
|delibary_price|string|null: false|
|delibary_type|string|null: false|
|prefecture|string|null: false|
|delivaly_days|string|null: false|
|price|intger|null: false|

### Association
- belongs_to :user
- has_many :likes
- has_many :image
- has_many :category



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|

### Association
- belongs_to :product



## Product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, index: true, foreign_key: true|
|image_id|references|null: false, index: true, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :image



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key: true|
|parent|string|null: false|
|child|string|
|son|string|

### Association
- belongs_to :product



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, index: true, foreign_key: true|
|user_id|references|null: false, index: true, foreign_key: true|
|count|intger|

### Association
- belongs_to :product
- belongs_to :user



## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, index: true, foreign_key: true|

### Association
- belongs_to :user



## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, index: true, foreign_key: true|
|seller_id|references|null: false, index: true, foreign_key: true|
|products_id|references|null: false, index: true, foreign_key: true|
|flug|references|null: false|

### Association
- belongs_to :product
- belongs_to :seller
- belongs_to :buyer
