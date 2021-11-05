class RemoveReferenceFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :addresses, :building, foreign_key: true
    remove_reference :addresses, :buildings, foreign_key: true
  end
end
