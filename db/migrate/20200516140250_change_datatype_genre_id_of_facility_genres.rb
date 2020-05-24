class ChangeDatatypeGenreIdOfFacilityGenres < ActiveRecord::Migration[6.0]
  def change
    change_column :facility_genres, :genre_id, :integer
  end
end
