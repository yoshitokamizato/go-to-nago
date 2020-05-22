class ChangeDatatypeOfMenus < ActiveRecord::Migration[6.0]
  def change
    change_column :menus, :created_user, :integer
    change_column :menus, :updated_user, :integer
  end
end
