class Address < ApplicationRecord
    has_many :customers
    has_many :buildings
end
