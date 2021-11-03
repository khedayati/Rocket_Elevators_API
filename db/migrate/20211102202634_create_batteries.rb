class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: true
      t.string :type
      t.string :status
      t.references :employee, foreign_key: true
      t.string :Date_of_
      t.date :commissioning
      t.date :date_of_last_inspection
      t.string :certificate_of_operations
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
