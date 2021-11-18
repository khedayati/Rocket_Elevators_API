ActiveAdmin.register Elevator do

  # To find the basic controller that come built-in active admin go to
  # https://github.com/activeadmin/inherited_resources/blob/master/lib/inherited_resources/actions.rb
  # print_message("test")
  controller do
    include ActiveAdmin::ElevatorHelper

    def update(options = {}, &block)
      object = resource

      elevator_status_before_update = object.status

      if update_resource(object, resource_params)
        puts options[:location] ||= smart_resource_url
        options[:location] ||= smart_resource_url
      end

      if elevator_status_before_update != object.status
        message = "The Elevator #{object.id} with Serial Number #{object.serial_number} has changed status from #{elevator_status_before_update} to #{object.status}."

        send_slack_notification(message)
      end

      if object.status == "Intervention"
        message = "Elevator #{object.id} has been suspended"
        send_sms_message(message)
      end

      respond_with_dual_blocks(object, options, &block)
    end
  end

  permit_params :column_id, :serial_number, :model, :elevator_type, :status, :Date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:column_id, :serial_number, :model, :elevator_type, :status, :Date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
