class AlterCustomerTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :contact
    remove_column :customers, :company_contact
    remove_column :customers, :service
    rename_column :customers, :full_name_of_the_company, :full_name_of_the_company_contact
    rename_column :customers, :email_of_the, :email_of_the_company_contact
    rename_column :customers, :technical_authority_phone_for, :technical_authority_phone_for_service
  end
end
