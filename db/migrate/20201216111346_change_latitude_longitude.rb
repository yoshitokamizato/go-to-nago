class ChangeLatitudeLongitude < ActiveRecord::Migration[6.0]
  def change
    change_column_null :facilities, :latitude, :float, true
    change_column_null :facilities, :longitude, :float, true
  end
end
