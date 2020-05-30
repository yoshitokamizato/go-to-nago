class RemoveStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :status, :integer
  end
end
