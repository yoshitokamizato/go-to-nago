class FacilityImage < ApplicationRecord
  belongs_to :facility, optional: true
  mount_uploader :image, DefaultUploader
  validates :image, presence: true
  validates :order, presence: true
  validates :order, uniqueness: {scope: :facility_id}
end
