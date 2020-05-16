class Facility < ApplicationRecord
has_many :bookmarks
has_many :users, through: :bookmarks
belongs_to :user
has_many :menus
has_many :facility_images

# 中間テーブルの設定
has_many :facility_genres, dependent: :destroy
has_many :genres, through: :facility_genres

# 以下のコマンドでfacilitiesとgenresのどちらかを編集したときにもう片方も反映させる
accepts_nested_attributes_for :facility_genres, allow_destroy: true

# typeカラムは本来使えないが、使える様にするコマンド
self.inheritance_column = :_type_disabled
# typeをenumで定義
enum type:{facility: 0,gourmet:1}
end
