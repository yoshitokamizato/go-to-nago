class ChangeOwnerIdOptionsTo < ActiveRecord::Migration[6.0]
  def change
    change_column :facilities, :owner_id, :integer, null: true, default: nil
  end
end
