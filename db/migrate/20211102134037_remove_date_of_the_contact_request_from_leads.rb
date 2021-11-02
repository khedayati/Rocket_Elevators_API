class RemoveDateOfTheContactRequestFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :date_of_the_contact_request, :date
  end
end
