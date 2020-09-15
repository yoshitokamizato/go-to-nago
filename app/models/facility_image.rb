class FacilityImage < ApplicationRecord
  belongs_to :facility, optional: true
end
