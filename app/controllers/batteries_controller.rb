class BatteriesController < InheritedResources::Base

  private

    def battery_params
      params.require(:battery).permit(:building_id, :type, :status, :employee_id, :date_of_commissioning, :date_of_last_inspection, :certificate_of_operations, :information, :notes)
    end

end
