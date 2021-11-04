class ChangeNameOfType < ActiveRecord::Migration[5.2]
  def change
    rename_column :batteries, :type, :battery_type
    rename_column :columns, :type, :column_type
    rename_column :elevators, :type, :elevator_type
  end
end
