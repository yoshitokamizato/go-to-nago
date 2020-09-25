class FacilityImage < ApplicationRecord
  belongs_to :facility, optional: true
  mount_uploader :image, DefaultUploader
end
