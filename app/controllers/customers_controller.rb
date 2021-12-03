class CustomersController < InheritedResources::Base

  private

    def customer_params
      params.require(:customer).permit(:user_id, :customer_creation_date, :company_name, :company_headquarters_address, :full_name_of_the_company_contact, :company_contact_phone, :email_of_the_company_contact, :company_description, :full_name_of, :service_technical_authority, :technical_authority_phone_for_service, :technical_manager_email_for_service, :address_id)
    end

end
