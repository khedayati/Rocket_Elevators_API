# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :employees, dependent: :destroy
  has_one :customer, dependent: :destroy
  # class_name: "employee", foreign_key: "employees_id" i did remove this one it works with it though

  def to_s
    self.first_name + " " + self.last_name
  end
end
