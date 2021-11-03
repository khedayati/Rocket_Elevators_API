class Customer < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :buildings
end
