class AddForeignKeyToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :employees
    add_foreign_key :interventions, :customers
    add_foreign_key :interventions, :buildings
    add_foreign_key :interventions, :batteries
    add_foreign_key :interventions, :columns
    add_foreign_key :interventions, :elevators
  end
end
