class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: false
  validates :birth_year, presence: false
  validates :prefecture, presence: false
  enum sex: {male: 0, female: 1, other: 2}
  enum role: {general: 0, owner: 1, admin: 2}
  enum status: {temporary: 0, active: 1, resign: 2}
  has_many :facilities

  #bookmarks関連のアソシエーション
  has_many :bookmarks, dependent: :destroy
  has_many :facilities, through:  :bookmarks
  # 以下のコマンドでfacilitiesとusersのどちらかを編集したときにもう片方も反映させる
  accepts_nested_attributes_for :bookmarks, allow_destroy: true
end
