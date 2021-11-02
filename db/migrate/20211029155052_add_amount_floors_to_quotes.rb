# frozen_string_literal: true

class AddAmountFloorsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :amount_floors, :string
    add_column :quotes, :amount_basements, :string
    add_column :quotes, :amount_parking_spots, :string
    add_column :quotes, :maximum_occupancy, :string
    add_column :quotes, :amount_apartments, :string
    add_column :quotes, :amount_companies, :string
    add_column :quotes, :amount_corporations, :string
    add_column :quotes, :business_hours, :string
  end
end
