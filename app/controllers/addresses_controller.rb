class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes, :customer_id, :building_id)
    end

end
