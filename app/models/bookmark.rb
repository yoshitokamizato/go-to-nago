class Bookmark < ApplicationRecord
belongs_to :user
belongs_to :facility
validates :user_id, uniqueness: { scope: :facility_id }
end
