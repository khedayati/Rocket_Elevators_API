class Intervention < ApplicationRecord
    belongs_to :employee
    belongs_to :customer
    belongs_to :building
    belongs_to :battery
    belongs_to :column 
    belongs_to :elevator
  
    def to_s
      "Intervention #" + self.id.to_s
    end
    def new
      @intervention = intervention.new
    end 
  end