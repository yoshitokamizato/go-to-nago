class ChangeDataTypeBirthYearOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :birth_year, :integer
  end
end
