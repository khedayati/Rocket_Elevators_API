class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.references :building, foreign_key: true
      t.string :information_key
      t.string :value

      t.timestamps
    end
  end
end
