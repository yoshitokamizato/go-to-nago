class AddReferencesToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :user, index:true
    add_reference :bookmarks, :facility, index:true, foreign_key:true
  end
end
