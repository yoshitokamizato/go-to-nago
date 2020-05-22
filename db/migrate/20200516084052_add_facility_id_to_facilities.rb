class AddFacilityIdToFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :facility_id, :integer
  end
end
