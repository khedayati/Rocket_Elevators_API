class RemoveContactDateColumnFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :contact_date, :datetime
  end
end
