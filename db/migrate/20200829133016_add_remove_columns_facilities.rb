class AddRemoveColumnsFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :opening_hours, :string
    remove_column :facilities, :first_open, :datetime
    remove_column :facilities, :first_close, :datetime
    remove_column :facilities, :last_open, :datetime
    remove_column :facilities, :last_close, :datetime
  end
end
