class AddReferenceToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :buildings, foreign_key: true
  end
end
