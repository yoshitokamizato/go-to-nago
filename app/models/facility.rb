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
validates :type, presence:  true
validates :name, presence:  true
validates :postal_code, presence: true
validates :address, presence: true
validates :latitude, presence: true
validates :longitude, presence: true
validates :description, presence: true
validates :parking, presence: true
validates :owner_id, presence: true
enum status: {"営業中": 0, "閉店": 1, "休業中": 2, "オープン予定": 3}
validates :created_id, presence: true
validates :updated_id, presence: true

# page nationの表示数を設定（もっと見るボタンを押す前）
paginates_per 10
end
