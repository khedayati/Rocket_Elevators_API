ActiveAdmin.register Quote do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :building_type, :amount_elevators, :product_line, :installation_fees, :total_cost, :amount_floors, :amount_basements, :amount_parking_spots, :maximum_occupancy, :amount_apartments, :amount_companies, :amount_corporations, :business_hours, :email, :company_name
  #
  # or
  
  permit_params do
    permitted = [:building_type, :amount_elevators, :product_line, :installation_fees, :total_cost, :amount_floors, :amount_basements, :amount_parking_spots, :maximum_occupancy, :amount_apartments, :amount_companies, :amount_corporations, :business_hours, :email, :company_name]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
