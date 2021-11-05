class AddCustomerIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :customer_id, :bigint
  end
end
