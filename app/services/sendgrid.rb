require 'sendgrid-ruby'
include SendGrid

class Sendgrid 
  attr_accessor :lead

  def initialize(lead)
    @lead = lead
  end

  def call
    mail = Mail.new
    mail.from = Email.new(email: ENV['EMAIL_FROM_CONTACT'])
    custom = Personalization.new
    custom.add_to(Email.new(email: lead.email))
    custom.add_dynamic_template_data({
      "fullName" => lead.full_name,
      "projectName" => lead.project_name
    })
    
    mail.add_personalization(custom)
    mail.template_id = ENV['TEMPLATE_ID']

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end