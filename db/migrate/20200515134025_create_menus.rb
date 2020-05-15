class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :facility_id
      t.string :name , null: false
      t.integer :price , null: false
      t.string :image , null: false
      t.text :content , null: false
      t.datetime :create_at , null: false
      t.datetime :update_at , null: false
      t.string :created_user , null: false
      t.string :updated_user, null: false
      t.timestamps
    end
  end
end
