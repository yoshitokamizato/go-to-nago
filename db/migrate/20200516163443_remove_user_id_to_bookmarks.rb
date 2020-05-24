class RemoveUserIdToBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookmarks, :user_id, :integer
    remove_column :bookmarks, :facility_id, :integer
  end
end
