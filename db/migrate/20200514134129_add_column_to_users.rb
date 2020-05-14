class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :birth_year, :integer
    add_column :users, :sex, :integer
    add_column :users, :prefecture, :integer
    add_column :users, :image, :string
    add_column :users, :role, :integer
    add_column :users, :profile, :text
    add_column :users, :status, :integer
  end
end
