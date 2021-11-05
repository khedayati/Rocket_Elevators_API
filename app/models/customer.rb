class Customer < ApplicationRecord
  # attr_reader :user_id, :customer_creation_date, :company_name, :company_headquarters_address, :full_name_of_the_company_contact,
  #   :company_contact_phone, :email_of_the_company_contact, :company_description, :technical_authority_phone_for_service, :technical_manager_email_for_service

  belongs_to :user
  belongs_to :address
  has_many :buildings
end
