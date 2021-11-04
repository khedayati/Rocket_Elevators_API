class ChangeDateOfCommissionigToDateOfCommissioning < ActiveRecord::Migration[5.2]
  def change
    rename_column :batteries, :date_of_commissionig, :date_of_commissioning
  end
end
