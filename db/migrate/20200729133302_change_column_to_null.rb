class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def change
    # usersテーブルのnickname, birth_year, prefectureのnot nullの解除
    change_column_null :users, :nickname, :string, true
    change_column_null :users, :birth_year, :datetime, true
    change_column_null :users, :prefecture, :integer, true
  end
end
