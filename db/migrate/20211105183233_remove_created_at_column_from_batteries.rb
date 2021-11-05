class RemoveCreatedAtColumnFromBatteries < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :created_at, :datetime
  end
end
