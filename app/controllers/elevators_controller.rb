class ElevatorsController < InheritedResources::Base

  private

    def elevator_params
      params.require(:elevator).permit(:column_id, :serial_number, :model, :type, :status, :Date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes)
    end

end
