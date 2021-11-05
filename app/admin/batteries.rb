ActiveAdmin.register Battery do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :building_id, :battery_type, :status, :employee_id, :Date_of_, :date_of_last_inspection, :certificate_of_operations, :information, :notes, :date_of_commissioning
  #
  # or
  #
  # permit_params do
  #   permitted = [:building_id, :battery_type, :status, :employee_id, :Date_of_, :date_of_last_inspection, :certificate_of_operations, :information, :notes, :date_of_commissioning]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
