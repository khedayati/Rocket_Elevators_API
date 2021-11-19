class ChangeTypeOfLongitudeLatitude < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :longitude, :decimal, precision: 15, scale: 10
    change_column :addresses, :latitude, :decimal, precision: 15, scale: 10
  end
end
