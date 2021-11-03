class Building < ApplicationRecord
  belongs_to :customer
  has_one :address
  has_one :building_detail
  has_many :batteries
  
end
