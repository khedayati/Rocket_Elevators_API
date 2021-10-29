class AddFunctionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :function, :string
  end
end
