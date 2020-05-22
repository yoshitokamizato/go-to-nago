class RemoveGenreIdToFacilityGenres < ActiveRecord::Migration[6.0]
  def change
    remove_column :facility_genres, :genre_id, :integer
  end
end
