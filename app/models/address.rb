class Address < ApplicationRecord
    has_many :customers, dependent: :destroy
    has_many :buildings, dependent: :destroy

  def to_s 
    "Address #" + self.id.to_s
  end
end
