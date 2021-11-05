class RemoveDateOfFromBatteries < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :Date_of
  end
end
