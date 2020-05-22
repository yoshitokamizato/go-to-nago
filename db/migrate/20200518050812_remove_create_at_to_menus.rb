class RemoveCreateAtToMenus < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :create_at, :datetime
    remove_column :menus, :update_at, :datetime
  end
end
