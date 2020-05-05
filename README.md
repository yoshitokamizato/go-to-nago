# README
* Ruby version
  ruby '2.6.4'
* mysql version

## facilitiesテーブル
|Column|Type|Options|memo|
|------|----|-------|----|
|id|integer|null: false,unique: true|施設|_id
|admin_id|integer|null: false,unique: true|管理者_id|
|name|string|null: false,unique: true|施設の名前|
|address|string|null: false|住所|
|tel|string|null: false|電話番号|
|email|string|null: false|メールアドレス|
|price|integer|-------|予算|
|facility_info|text|null: false|紹介文|
|comment|text|-------|強み|
|one_point|text|-------|楽しむためのワンポイント|
|business_hours|string|-------|営業時間|
|holiday|string|-------|定休日|
|parking|string|null: false|駐車場|
|area|string|-------|経度|
|image_url|text|null: false|お店の写真|
|home_page|string|-------|HP情報|
|instagram|string|-------|instagram|
|twitter|string|-------|twitter|
|youtube|string|-------|YouTube|
|coupon|string|-------|クーポン情報|
### Association
-belongs_to :admin_id
-has_many :reviews
-has_many :menu
-has_many :bookmarks

## bookmarks
|Column|Type|Options|memo|
|------|----|-------|----|
|user_id|integer|null: false|登録ユーザー_id|
|facility_id|integer|null: false|施設_id|
### Association
-has_many :user
-has_many :facility

## reviews
|Column|Type|Options|memo|
|------|----|-------|----|
|user_id|integer|null: false|登録ユーザー_id|
|facility_id|integer|null: false|施設_id|
|text|text|null: false|口コミ|
### Association
-belongs_to :user
-belongs_to :facility

## menus
|Column|Type|Options|memo|
|------|----|-------|----|
|facility_id|integer|null: false|施設_id|
|menu|string|null: false|メニュー|
|menu_price|integer|null: false|料金|
|image|string|-------|メニューの写真|
|text|text|null: false|メニューの紹介|
### Association
-belongs_to :facility



