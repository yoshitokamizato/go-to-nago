class RemoveColumnFacilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :user_id, :integer
  end
end
