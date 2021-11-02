# frozen_string_literal: true

ActiveAdmin.register Quote do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :building_type, :amount_elevators, :product_line, :installation_fees, :total_cost
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_type, :amount_elevators, :product_line, :installation_fees, :total_cost]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
