ActiveAdmin.register Intervention do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status
    #
    # or
    #
    # permit_params do
    #   permitted = [:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
end
    