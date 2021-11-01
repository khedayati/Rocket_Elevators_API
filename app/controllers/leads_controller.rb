class LeadsController < InheritedResources::Base

  private

    def lead_params
      params.require(:lead).permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_the_elevators, :message, :date_of_the_contact_request)
    end

end
