require 'net/http'
require 'uri'
require 'json'

def make_slack_api_url
  uri = URI.parse("https://slack.com/api/chat.postMessage")

  headers = {'Content_type' => 'application/json','Authorization' => "Bearer xoxb-340694917717-2732966579220-JV3Ah1V2IuVyYvlLaLkt8rCw"}
  body = {'channel' => 'testingbot', 'text' => "Sent from code"}

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, headers)
  request.body = body.to_json
  http.use_ssl = (uri.scheme == "https")
  response = http.request(request)
  puts "JSON BODY : #{body.to_json}"
  puts ""
  puts "RESPONSE: #{ response.to_json}"
  puts ""
end

ActiveAdmin.register Elevator do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  # To find the basic controller that come built-in active admin go to
  # https://github.com/activeadmin/inherited_resources/blob/master/lib/inherited_resources/actions.rb
  controller do
    def update(options={}, &block)
      object = resource
      
      elevator_status_before_update = object.status
      make_slack_api_url

      if update_resource(object, resource_params)
        puts options[:location] ||=smart_resource_url
        options[:location] ||= smart_resource_url
      end

      if elevator_status_before_update != object.status
        
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
