class ChangePhoneFormatInLeadsTable < ActiveRecord::Migration[5.2]
  def up
    change_column :leads, :phone, :string
  end
  def down
    change_column :leads, :phone, :integer
  end
end
