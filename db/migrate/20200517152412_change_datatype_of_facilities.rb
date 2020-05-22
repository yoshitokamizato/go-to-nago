class ChangeDatatypeOfFacilities < ActiveRecord::Migration[6.0]
  def change
    # 型を変更
    change_column :facilities, :created_user, :integer
    change_column :facilities, :updated_user, :integer
    # user_idを追加
    add_column :facilities, :user_id, :integer
  end
end
