class Facility < ApplicationRecord
has_many :bookmarks
has_many :users, through: :bookmarks
belongs_to :user
has_and_belongs_to_many :genre
has_many :menus
has_many :facility_images
end
