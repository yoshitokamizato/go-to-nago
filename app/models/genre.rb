class Genre < ApplicationRecord
  has_many :facility_genres
  has_many :facilities, through: :facility_genres
end
