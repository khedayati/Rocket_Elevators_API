class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevators, dependent: :destroy
  has_many :intervention

  def to_s 
    "Column #" + self.id.to_s
  end
end
