# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  def authenticate_employee_user!
    authenticate_user!
    unless current_user.employees.exists?
      flash[:flash] = 'Unauthorized Access!'
      redirect_to root_path

    end
  end
end
