class BuildingsController < InheritedResources::Base

  private

    def building_params
      params.require(:building).permit(:customer, :address_of_the_building, :full_name_of_the_building_administrator, :email_of_the_administrator_of_the_building, :phone_number_of_, :the_building_administrator, :full_name_of_the_technical_contact_for_the_building, :technical_contact_email_for, :the_building, :technical_contact_phone_for_the_building, :database, :development)
    end

end
