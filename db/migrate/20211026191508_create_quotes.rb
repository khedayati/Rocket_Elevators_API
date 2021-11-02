# frozen_string_literal: true

class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :amount_elevators
      t.string :product_line
      t.string :installation_fees
      t.string :total_cost

      t.timestamps
    end
  end
end
