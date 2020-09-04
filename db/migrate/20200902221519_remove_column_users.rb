class RemoveColumnUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :reset_password_sent_at, :datetime
    remove_column :users, :remember_created_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
  end
end
