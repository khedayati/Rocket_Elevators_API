class AddReference2ToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :address, foreign_key: true
  end
end
