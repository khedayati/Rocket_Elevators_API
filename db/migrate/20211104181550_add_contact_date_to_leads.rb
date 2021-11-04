class AddContactDateToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :contact_date, :Date
  end
end
