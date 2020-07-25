class AddReferencesToFacilityGenres < ActiveRecord::Migration[6.0]
  def change
    add_reference :facility_genres, :facility, index: true
    add_reference :facility_genres, :genre, index: true, foreign_key: true
  end
end
