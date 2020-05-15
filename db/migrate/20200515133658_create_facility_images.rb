class CreateFacilityImages < ActiveRecord::Migration[6.0]
  def change
    create_table :facility_images do |t|
      t.integer :facility_id
      t.string :image , null: false
      t.integer :order , null: false
      t.string :created_user ,	null: false
      t.timestamps
    end
  end
end
