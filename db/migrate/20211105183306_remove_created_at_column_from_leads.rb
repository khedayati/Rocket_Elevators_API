class RemoveCreatedAtColumnFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :created_at, :datetime
  end
end
