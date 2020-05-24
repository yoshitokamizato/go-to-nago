class RemoveUpdateAtToFacilities < ActiveRecord::Migration[6.0]
  def change
    remove_column :facilities, :update_at, :datetime
  end
end
