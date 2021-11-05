class Elevator < ApplicationRecord
  belongs_to :column

  def to_s
    "Elevator #" + self.id.to_s
  end
end
