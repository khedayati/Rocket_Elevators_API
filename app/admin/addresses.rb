ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes
  #
  # or
  #
  permit_params do
    permitted = [:type_of_address, :status, :entity, :number_and_street, :suite_or_apartment, :city, :postal_code, :country, :notes]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
