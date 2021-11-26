class ChangePhoneInLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :phone, :integer
    add_column :leads, :phone, :string
  end
end
