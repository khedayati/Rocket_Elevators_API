class FactIntervention < ApplicationRecord

    belongs_to :employee
    
    def to_s
        "Intervention #" + self.id.to_s
    end
    def show
        @intervention = intervention.new
    end
end
