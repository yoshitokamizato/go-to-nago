


# README
* Ruby version
  ruby '2.6.4'
* mysql version

## facilitysテーブル
|Column|Type|Options|
|------|----|-------|
|facility_name|string|null: false,unique: true|
|address|string|null: false|
|tel|string|null: false|
|email|string|
|price|integer|
|facility_info|text|null: false|
|one_point|text|
|business_hours|string|
|holiday|string|
|parking|string|null: false|
|image_url|text|null: false|
|home_page|string|
|area|string|
|coupon|string|
### Association
-belongs_to :bookmark
-belongs_to :admin_user
-has_many :sns
-has_many :comments
-has_many :reviews


-has_many :menu


## snsテーブル
|Column|Type|Options|
|------|----|-------|
|facility_id|integer|
|instagram|string|
|twitter|string|
### Association
-belongs_to :facility

## comments
|Column|Type|Options|
|------|----|-------|
|facility_id|integer|null: false |
|text|text|null: false |
### Association
-belongs_to :facility

## bookmark
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|facility_id|integer|
### Association
-has_many :user
-has_many :facility

## reviews
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|facility_id|integer|
|text|text|
### Association
-belongs_to :user
-belongs_to :facility

## menu
|Column|Type|Options|
|------|----|-------|
|facility_id|integer|
|menu_price|integer|
|image|string|
|text|text|
### Association
-belongs_to :facility



