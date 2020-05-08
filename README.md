# README
* Ruby version
  ruby '2.6.4'
* mysql version

## facilitiesテーブル
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|-----|店舗・施設_id｜
|owner_id|integer|null: false,unique: true|管理者_id|
|name|string|null: false|名前|
|postal_code|integer|null: false|郵便番号|
|address|string|null: false|住所|
|latitude|float|null: false|緯度|
|longitude|float|null: false|経度|
|running_time|string|-------|走行距離（車で○分）|
|tel|string|------|電話番号|
|email|string|------|メールアドレス|
|budget|integer|-------|予算|
|description|text|null: false|紹介文|
|comment|text|-------|強み|
|advice|text|-------|楽しむためのワンポイント・アドバイス|
|business_hours|integer|-------|営業時間|
|holiday|string|-------|定休日|
|parking|string|null: false|駐車場|
|home_page|string|-------|HP情報|
|instagram|string|-------|instagram|
|twitter|string|-------|twitter|
|youtube|string|-------|YouTube|
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
|status|string|-------|状態|
### Association
-belongs_to :facility_genre
-belongs_to :owner_id
-belongs_to :genres
-has_many :reviews
-has_many :menu
-has_many :bookmarks
-has_many :facility_images

## bookmarks
|Column|Type|Options|memo|
|------|----|-------|----|
|user_id|integer|null: false|登録ユーザー_id|
|facilities_id|integer|------|店舗・施設_id｜
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
### Association
-has_many :user
-has_many :facilities

## menus
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|menu|string|null: false|メニュー|
|menu_price|integer|null: false|料金|
|image|string|-------|メニューの写真|
|content|text|null: false|メニューの紹介|
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
### Association
-belongs_to :facilities

## genres
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|genre_name|string|null: false|種類(どのような施設か)|
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
### Association
-has_many :facilities

## facility_genre
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|facility_genre|string|null: false|店・施設の種類|
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
### Association
-has_many :facilities




## facility_images
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|owner_id|integer|------|管理者_id|
|created_at|datetime|null: false|作成日時|
|edit_at|datetime|null: false|編集日時|
|edit_name|string|null: false|編集者名|
|images|text|null: false|お店・施設の写真|
### Association
-belongs_to :facilities, optional: true

## strength
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|owner_id|integer|------|管理者_id|
|strength|text|null: false|強み|
### Association
-belongs_to :facilities
  
<!-- 後回しにする機能 -->
<!-- ## reviews
|Column|Type|Options|memo|
|------|----|-------|----|
|user_id|integer|null: false|登録ユーザー_id|
|store_id|integer|--------|店舗_id｜
|gourmet_id|integer|-------|施設_id｜
|content|text|null: false|口コミ|
### Association
-belongs_to :user
-belongs_to :facilities

## coupons
|Column|Type|Options|memo|
|------|----|-------|----|
|coupon_id|integer|null: false|クーポン情報|
|store_id|integer|null: false|店舗_id|
|content|text|-------|クーポン詳細|
|image_url|string|-------|クーポン画像|

 -->
