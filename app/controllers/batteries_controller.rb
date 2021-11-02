class BatteriesController < InheritedResources::Base

  private

    def battery_params
      params.require(:battery).permit(:building_id, :type, :status, :employee_id, :Date_of_, :commissioning, :date_of_last_inspection, :certificate_of_operations, :information, :notes)
    end

end
