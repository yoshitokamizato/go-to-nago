# README
* Ruby version
  ruby '2.6.4'
* mysql version

## facilitiesテーブル
|Column|Type|Options|
|------|----|-------|
|admin_id|integer|null: false,unique: true|
<!-- 店舗情報 -->
|name|string|null: false,unique: true|
|address|string|null: false|
|tel|string|null: false|
|email|string|
<!-- 予算 -->
|price|integer|
<!-- 紹介文 -->
|facility_info|text|null: false|
<!-- 強み・楽しむためのワンポイント -->
|comment|text|
|one_point|text|
<!-- 営業時間・定休日・駐車場・経度 -->
|business_hours|string|
|holiday|string|
|parking|string|null: false|
|area|string|
<!-- お店の写真 -->
|image_url|text|null: false|
<!-- HP・SNS情報 -->
|home_page|string|
|instagram|string|
|twitter|string|
|youtube|string|
<!-- クーポン -->
|coupon|string|
### Association
-belongs_to :admin_id
-has_many :reviews
-has_many :menu
-has_many :bookmarks



<!-- お気に入り -->
## bookmarks
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|facility_id|integer|
### Association
-has_many :user
-has_many :facility

<!-- 口コミ -->
## reviews
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|facility_id|integer|
|text|text|
### Association
-belongs_to :user
-belongs_to :facility

<!-- メニュ(種類・ジャンル)ー -->
## menus
|Column|Type|Options|
|------|----|-------|
|facility_id|integer|
|menu_price|integer|
|image|string|
|text|text|
### Association
-belongs_to :facility



