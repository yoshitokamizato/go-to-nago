class AddUniqueIndexToFacilityImages < ActiveRecord::Migration[6.0]
  def change
    add_index :facility_images, [:facility_id, :order], unique: true
  end
end
