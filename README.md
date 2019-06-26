# README

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
|prefectures|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|building|string|
|phone_number|intger|
|card_number|intger|null: false|
|expiration_month|intger|null: false|
|expiration_year|intger|null: false|
|security_code|intger|null: false|

### Association
- has_many :products
- has_many :likes



## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|description|text|null: false|
|category_id|references|null: false,foreign_key: true|
|size|string|null: false|
|brand|string|
|condition|string|null: false|
|delibary_price|string|null: false|
|delibary_type|string|null: false|
|area|string|null: false|
|delivaly_days|string|null: false|
|price|intger|null: false|

### Association
- belongs_to :user
- has_many :likes
- has_many :image
- has_many :category



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key: true|
|parent|string|null: false|
|child|string|
|son|string|

### Association
- belongs_to :product



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :product



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false,foreign_key: true|
|user_id|references|null: false,foreign_key: true|
|count|intger|

### Association
- belongs_to :product
- belongs_to :user



## addressテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture_id|integer|
|city|string|

### Association



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
