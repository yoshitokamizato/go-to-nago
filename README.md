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
|running_time|string|-------|那覇空港からの所要時間（車）|
|tel|string|------|電話番号|
|email|string|------|メールアドレス|
|budget|integer|-------|予算|
|description|text|null: false|紹介文|
|advice|text|-------|楽しむためのワンポイント・アドバイス|
|first_open|datetime|-------|後半の開始時間|
|first_close|datetime|-------|前半の終了時間|
|last_open|datetime|-------|後半の時間|
|last_close|datetime|-------|後半の終了時間|
|holiday|string|-------|定休日|
|parking|string|null: false|駐車場|
|home_page|string|-------|HP情報|
|instagram|string|-------|instagram|
|twitter|string|-------|twitter|
|youtube|string|-------|YouTube|
|created_at|datetime|null: false|作成日時|
|updated_at|datetime|null: false|更新日時|
|updated_user|string|null: false|編集者名|
|author|string|null: false|作成者名|
|status|integer|-------|状態（営業中・閉店・休業中）|
|facility_genre|int|enum {お店: 0, 施設: 1}, defaults: 0 ,null: false|店・施設の種類|
### Association
-belongs_to :owner_id
-belongs_to :genre
-belongs_to :facility_list
-has_many :reviews
-has_many :menus
-has_many :bookmarks
-has_many :facility_images

## bookmarks
|Column|Type|Options|memo|
|------|----|-------|----|
|user_id|integer|null: false|登録ユーザー_id|
|facilities_id|integer|------|店舗・施設_id｜
### Association
-belongs_to :user
-belongs_to :facility

## menus
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|name|string|null: false|メニュー|
|price|integer|null: false|料金|
|images|string|-------|メニューの写真|
|content|text|null: false|メニューの紹介|
|created_at|datetime|null: false|作成日時|
|updated_at|datetime|null: false|更新日時|
|updated_user|string|null: false|編集者名|
### Association
-belongs_to :facility, optional: true

## genres
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|name|string|null: false|種類(どんなジャンルのお店・施設か）|
### Association
-has_many :facility_list

## facility_list
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|-----|店舗・施設_id｜
|genre_id|string|null: false|種類(どのような施設か)|
### Association
-belongs_to :facility
-belongs_to :genre
facilityのジャンルを複数持たせるためのテーブル

## facility_images
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|images|string|null: false|お店・施設の写真|
|created_at|datetime|null: false|作成日時|
|updated_at|datetime|null: false|更新日時|
|updated_user|string|null: false|編集者名|
### Association
-belongs_to :facility, optional: true

## strength
|Column|Type|Options|memo|
|------|----|-------|----|
|facilities_id|integer|------|店舗・施設_id｜
|owner_id|integer|------|管理者_id|
|strength|text|null: false|強み|
### Association
-belongs_to :facility


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