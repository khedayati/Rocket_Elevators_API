class AddAttachmentToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :attachment, :binary
  end
end
