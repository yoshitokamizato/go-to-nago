class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.integer :type , null: false ,defaults: 0 
      t.string :name, null: false
      t.integer :postal_code, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :running_time , defaults: 0
      t.string :tel , defaults: 0
      t.string :email , defaults: 0
      t.integer :budget , defaults: 0
      t.text :description , null: false
      t.text :advice , defaults: 0
      t.datetime :first_open , defaults: 0
      t.datetime :first_close, defaults: 0
      t.datetime :last_open , defaults: 0
      t.datetime :last_close , defaults: 0
      t.string :holiday , defaults: 0
      t.string :parking , null: false
      t.string :home_page , 	defaults: 0
      t.integer :owner_id , null: false
      t.string :instagram , defaults: 0
      t.string :twitter , defaults: 0
      t.string :youtube , defaults: 0
      t.integer :status , defaults: 0
      t.datetime :update_at ,	null: false
      t.string :created_user ,	null: false
      t.string :updated_user ,	null: false
      t.timestamps
    end
  end
end
