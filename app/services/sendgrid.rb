require 'sendgrid-ruby'
include SendGrid

class Sendgrid 
  attr_accessor :lead

  def initialize(lead)
    @lead = lead
  end

  def call 
    # puts 'sendgrid'
    mail = Mail.new
    mail.from = Email.new(email: 'rocketelevators.team@gmail.com')
    custom = Personalization.new
    custom.add_to(Email.new(email: @lead.email))
    custom.add_dynamic_template_data({
      "fullName" => @lead.full_name,
      "projectName" => @lead.project_name
    })
    
    mail.add_personalization(custom)
    mail.template_id = 'd-a139386f69394a49ab3cf9c478b80768'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end