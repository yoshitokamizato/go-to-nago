class RemoveFacilityIdToFacilityGenres < ActiveRecord::Migration[6.0]
  def change
        remove_column :facility_genres, :facility_id, :integer
  end
end
