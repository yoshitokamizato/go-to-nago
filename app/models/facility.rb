class Facility < ApplicationRecord
belongs_to :user
has_many :menus
has_many :facility_images


#bookmarks 中間テーブルの設定
has_many :bookmarks,dependent: :destroy
# facilityのお気に入り判定 → views側で呼び出し
def bookmark_by?(user)
  bookmarks.where(user_id: user.id).exists?
end

# genres 中間テーブルの設定
has_many :facility_genres, dependent: :destroy
has_many :genres, through: :facility_genres
# 以下のコマンドでfacilitiesとgenresのどちらかを編集したときにもう片方も反映させる
accepts_nested_attributes_for :facility_genres, allow_destroy: true



# typeカラムは本来使えないが、使える様にするコマンド
self.inheritance_column = :_type_disabled
# typeをenumで定義
enum type:{facility: 0,gourmet:1}
end
