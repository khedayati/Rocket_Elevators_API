# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :employees
  has_one :customer
  # class_name: "employee", foreign_key: "employees_id" i did remove this one it works with it though
end
