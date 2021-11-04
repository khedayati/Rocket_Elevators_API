class FactElevatorsController < InheritedResources::Base

  private

    def fact_elevator_params
      params.require(:fact_elevator).permit()
    end

end
