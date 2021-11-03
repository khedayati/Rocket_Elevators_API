class Column < ApplicationRecord
  belongs_to :batterie
  has_many :elevators
end
