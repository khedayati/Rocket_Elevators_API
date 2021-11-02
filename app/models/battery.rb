class Battery < ApplicationRecord
  belongs_to :building
  belongs_to :employee
end
