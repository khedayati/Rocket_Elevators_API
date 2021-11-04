class AddDateOfCreationToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :date_of_creation, :date
  end
end
