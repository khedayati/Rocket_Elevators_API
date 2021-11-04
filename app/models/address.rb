class Address < ApplicationRecord
    has_many :customer
    has_many :building
end
