class CreateFacilityGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :facility_genres do |t|
      t.integer :facility_id
      t.string :genre_id
      t.timestamps
    end
  end
end
