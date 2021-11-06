class RemoveCreatedAtColumnFromElevators < ActiveRecord::Migration[5.2]
  def change
    remove_column :elevators, :created_at, :datetime
  end
end
