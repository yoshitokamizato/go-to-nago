class ChangeDatatypeOfFacilityImages < ActiveRecord::Migration[6.0]
  def change
    change_column :facility_images, :created_user, :integer
  end
end
