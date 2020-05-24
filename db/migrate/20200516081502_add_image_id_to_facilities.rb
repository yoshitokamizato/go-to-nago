class AddImageIdToFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :facility_image_id, :integer
  end
end
