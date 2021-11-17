# require 'net/http'
# require 'uri'
# require 'json'

# require 'rubygems'
# require 'twilio-ruby'

# def send_sms_message(message)
#   # Find your Account SID and Auth Token at twilio.com/console
#   # and set the environment variables. See http://twil.io/secure
#   account_sid = ENV['TWILIO_ACCOUNT_SID']
#   auth_token = ENV['TWILIO_AUTH_TOKEN']
#   @client = Twilio::REST::Client.new(account_sid, auth_token)

#   message = @client.messages
#     .create(
#       body: "#{message}",
#       from: "#{ENV['TWILIO_FROM_PHONE']}",
#       to: "#{ENV['TWILIO_TO_PHONE']}"
#     )

#   puts message.sid
# end

# def send_slack_notification(message)
#   uri = URI.parse("https://slack.com/api/chat.postMessage")

#   # Might have to change the bearer token since they get outdated fast
#   headers = {'Content-type' => 'application/json','Authorization' => "Bearer #{ENV['SLACK_API_TOKEN']}"}
#   # Need to change the channel to something that fit what the coatch want
#   body = {'channel' => 'team-serge-emma-api', 'text' => "#{message}"}

#   http = Net::HTTP.new(uri.host, uri.port)
#   request = Net::HTTP::Post.new(uri.request_uri, headers)
#   request.body = body.to_json
#   http.use_ssl = (uri.scheme == "https")
#   response = http.request(request)
# end

ActiveAdmin.register Elevator do


  # To find the basic controller that come built-in active admin go to
  # https://github.com/activeadmin/inherited_resources/blob/master/lib/inherited_resources/actions.rb
  controller do
    def update(options={}, &block)
      object = resource
      
      elevator_status_before_update = object.status

      if update_resource(object, resource_params)
        puts options[:location] ||=smart_resource_url
        options[:location] ||= smart_resource_url
      end

      # if elevator_status_before_update != object.status
      #   message = "The Elevator #{object.id} with Serial Number #{object.serial_number} has changed status from #{elevator_status_before_update} to #{object.status}."

      #   send_slack_notification(message)
      # end

      # if object.status == "Intervention"
      #   message = "Elevator #{object.id} has been suspended"
      #   send_sms_message(message)
      # end

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
