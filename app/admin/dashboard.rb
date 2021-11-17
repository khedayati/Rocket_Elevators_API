# frozen_string_literal: true
#= require chartkick

require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

authenticator = Authenticators::IamAuthenticator.new(
  apikey: ENV['IBM_API_TOKEN']
)
text_to_speech = TextToSpeechV1.new(
  authenticator: authenticator
)
text_to_speech.service_url = "***REMOVED***"

text_to_speech.configure_http_client(disable_ssl_verification: true)





def gapm(connection, month, table)
  # Get amount per month
  connection.exec("SELECT * FROM #{table} WHERE extract(month FROM creation_date) = #{month}").ntuples
end



def make_data_gebp_graph(connection)
  @data = {}
  @total = 0
  @amount_customers = connection.exec("SELECT * FROM dim_customers").count
  i = 1
  connection.exec("SELECT nb_elevator FROM dim_customers").each do |nb_elevator|
    @data["customer#{i}"] = nb_elevator["nb_elevator"]
    @total += nb_elevator["nb_elevator"].to_i
    i += 1
  end
  puts @total
  return @data
end


def get_text_to_speech_data
  data = {}
  data['elevator_amount'] = Elevator.count
  data['customer_amount'] = Customer.count
  data['building_amount'] = Building.count
  data['stopped_elevators'] = Elevator.all.select { |elevator| elevator.status == 'offline' }.count
  data['quote_amount'] = Quote.count
  data['lead_amount'] = Lead.count
  data['battery_amount'] = Battery.count
  data['city_amount'] = Address.select(:city).distinct.count
  return data
end

def get_text_to_speech_text
  data = get_text_to_speech_data
  first_line = "Greetings #{current_user}            \n"
  second_line = "There are currently #{data['elevator_amount']} elevators deployed in the #{data['building_amount']} buildings of your #{data['customer_amount']} customers \n           "
  third_line = "You currently have #{data['quote_amount']} quote awaiting proccessing \n         "
  fourth_line = "You currently have #{data['lead_amount']} leads in your contract request \n"
  last_line = "#{data['battery_amount']} battery are deployed across #{data['city_amount']} cities"

  text = first_line + second_line + third_line + fourth_line + last_line
end



ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do


  File.open("public/dashboard_audio.wav", "wb") do |audio_file|
    response = text_to_speech.synthesize(
      text: get_text_to_speech_text,
      accept: "audio/wav",
      voice: "en-US_HenryV3Voice"
    )
    audio_file.write(response.result)
  end
    

  connection = PG::Connection.new(host:'***REMOVED***',port:'5432',dbname:'***REMOVED***',user:'***REMOVED***',password:'***REMOVED***')
  first_2_question = column_chart [{name: "Contacts Requests", data: {
    "January" => gapm(connection, 1, "fact_contacts"),
    "February" => gapm(connection, 2, "fact_contacts"),
    "March" => gapm(connection, 3, "fact_contacts"),
    "April" =>  gapm(connection, 4, "fact_contacts"),
    "May" => gapm(connection, 5, "fact_contacts"),
    "June" => gapm(connection, 6, "fact_contacts"),
    "July" => gapm(connection, 7, "fact_contacts"),
    "August" => gapm(connection, 8, "fact_contacts"),
    "September" => gapm(connection, 9, "fact_contacts"),
    "October" => gapm(connection, 10, "fact_contacts"),
    "November" => gapm(connection, 11, "fact_contacts"),
    "December" => gapm(connection, 12, "fact_contacts")}},
  {name: "Quotes Requests",  data: {
    "January" => gapm(connection, 1, "fact_quotes"),
    "February" => gapm(connection, 2, "fact_quotes"),
    "March" => gapm(connection, 3, "fact_quotes"),
    "April" =>  gapm(connection, 4, "fact_quotes"),
    "May" => gapm(connection, 5, "fact_quotes"),
    "June" => gapm(connection, 6, "fact_quotes"),
    "July" => gapm(connection, 7, "fact_quotes"),
    "August" => gapm(connection, 8, "fact_quotes"),
    "September" => gapm(connection, 9, "fact_quotes"),
    "October" => gapm(connection, 10, "fact_quotes"),
    "November" => gapm(connection, 11, "fact_quotes"),
    "December" => gapm(connection, 12, "fact_quotes")}}]


    audio controls: true do
      source src: audio_path('/dashboard_audio.wav'), type: "audio/wav"
    end
    puts get_text_to_speech_data
    panel "First and Second Question" do
      first_2_question
    end
    panel "Third Question" do
      line_chart [{name: "Amount Of Elevator Per Customer", data: make_data_gebp_graph(connection)}]
    end
  end
end

