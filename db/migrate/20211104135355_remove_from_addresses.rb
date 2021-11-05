class RemoveFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :customer_id, :bigint
  end
end
