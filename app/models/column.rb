class Column < ApplicationRecord
  belongs_to :battery
  has_many :elevators, dependent: :destroy

  def to_s 
    "Column #" + self.id.to_s
  end
end
