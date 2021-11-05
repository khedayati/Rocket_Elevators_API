ActiveAdmin.register Lead do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_the_elevators, :message, :contact_date, :date_of_creation
  #
  # or
  
  permit_params do
    permitted = [:full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_the_elevators, :message, :contact_date, :date_of_creation]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
