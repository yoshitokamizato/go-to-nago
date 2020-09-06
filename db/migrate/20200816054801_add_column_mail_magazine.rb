class AddColumnMailMagazine < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mailmagazine, :boolean, default: false, null: false
  end
end
