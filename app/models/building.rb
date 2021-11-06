class Building < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  has_one :building_detail, dependent: :destroy
  has_many :batteries, dependent: :destroy
  
  def to_s 
    "Building #" + self.id.to_s
  end

end
