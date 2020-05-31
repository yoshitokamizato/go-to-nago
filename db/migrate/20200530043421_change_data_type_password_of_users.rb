class ChangeDataTypePasswordOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :password, :string
  end
end
