class RemoveCreatedAtColumnFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :created_at, :datetime
  end
end
