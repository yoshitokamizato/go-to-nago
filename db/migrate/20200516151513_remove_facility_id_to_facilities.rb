class RemoveFacilityIdToFacilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities ,:facility_id ,:integer
  end
end
