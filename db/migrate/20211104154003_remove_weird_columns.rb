class RemoveWeirdColumns < ActiveRecord::Migration[5.2]
  def change
    # remove_column :batteries, :Date_of_, :string
    remove_column :batteries , :commissioning, :date
    add_column :batteries, :date_of_commissionig, :date
    remove_column :buildings, :phone_number_of_, :string
    remove_column :buildings, :the_building_administrator, :string
    add_column :buildings, :pnhone_number_of_the_building_administrator, :string
    remove_column :buildings, :technical_contact_email_for, :string
    remove_column :buildings, :the_building, :string
    add_column :buildings, :technical_contact_email_for_the_building, :string
    remove_column :buildings, :database, :string
    remove_column :buildings, :development, :string
    remove_column :customers, :full_name_of, :string
    remove_column :customers, :service_technical_authority, :string
    add_column :customers, :full_name_of_service_technical_authority, :string
  end
end
