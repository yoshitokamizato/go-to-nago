class RemoveColumnToFacilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :facility_image_id, :integer
  end
end
