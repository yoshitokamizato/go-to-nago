class Genre < ApplicationRecord
  has_and_belongs_to_many :facilities
end
