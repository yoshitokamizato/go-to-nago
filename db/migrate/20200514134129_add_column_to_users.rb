class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :birth_year, :datetime, null: false
    add_column :users, :sex, :integer
    add_column :users, :prefecture, :integer, null: false
    add_column :users, :image, :string
    add_column :users, :role, :integer, null: false, default: 0
    add_column :users, :profile, :text
    add_column :users, :status, :integer, null: false, default: 0
  end
end
