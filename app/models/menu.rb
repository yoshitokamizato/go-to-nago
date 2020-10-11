class Menu < ApplicationRecord
  belongs_to :facility, optional: true
  # menuのもっと見るボタンで表示する数を指定(kaminariを使用)
  paginates_per 10
  mount_uploader :image, DefaultUploader
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :content, presence: true
  validates :order, presence: true, uniqueness: {scope: :facility_id}

  default_scope { order(order: :asc) }

end
