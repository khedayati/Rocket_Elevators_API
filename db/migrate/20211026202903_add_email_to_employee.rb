# frozen_string_literal: true

class AddEmailToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :email, :string
  end
end
