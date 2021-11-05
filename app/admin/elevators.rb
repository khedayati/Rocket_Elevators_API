ActiveAdmin.register Elevator do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :column_id, :serial_number, :model, :elevator_type, :status, :Date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes
  #
  # or
  #
  permit_params do
    permitted = [:column_id, :serial_number, :model, :elevator_type, :status, :Date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
