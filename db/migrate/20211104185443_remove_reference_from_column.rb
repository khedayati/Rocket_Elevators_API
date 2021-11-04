class RemoveReferenceFromColumn < ActiveRecord::Migration[5.2]
  def change
    remove_reference :columns, :batterie, foreign_key: true
  end
end
