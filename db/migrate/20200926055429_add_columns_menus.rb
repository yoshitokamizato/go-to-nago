class AddColumnsMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :order, :integer, null: false
    add_index :menus, [:facility_id, :order], unique: true
  end
end
