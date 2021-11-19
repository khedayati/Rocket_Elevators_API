# frozen_string_literal: true
#= require chartkick

require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson


authenticator = Authenticators::IamAuthenticator.new(
 apikey: ENV["IBM_API_TOKEN"],
)
text_to_speech = TextToSpeechV1.new(
 authenticator: authenticator,
)
text_to_speech.service_url = "***REMOVED***"
text_to_speech.configure_http_client(disable_ssl_verification: true)


ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

   File.open("public/dashboard_audio.wav", "wb") do |audio_file|
     response = text_to_speech.synthesize(
       text: get_text_to_speech_text,
       accept: "audio/wav",
       voice: "en-US_MichaelV3Voice",
     )
     audio_file.write(response.result)
   end


    connection = PG::Connection.new(host: ENV['POSTGRESQL_DATABASE_HOST'], port: "5432", dbname: ENV['POSTGRESQL_DATABASE_DBNAME'], user: ENV['POSTGRESQL_DATABASE_USER'], password: ENV['POSTGRESQL_DATABASE_PASSWORD'])
    first_2_question = column_chart [{ name: "Contacts Requests", data: {
                                     "January" => gapm(connection, 1, "fact_contacts"),
                                     "February" => gapm(connection, 2, "fact_contacts"),
                                     "March" => gapm(connection, 3, "fact_contacts"),
                                     "April" => gapm(connection, 4, "fact_contacts"),
                                     "May" => gapm(connection, 5, "fact_contacts"),
                                     "June" => gapm(connection, 6, "fact_contacts"),
                                     "July" => gapm(connection, 7, "fact_contacts"),
                                     "August" => gapm(connection, 8, "fact_contacts"),
                                     "September" => gapm(connection, 9, "fact_contacts"),
                                     "October" => gapm(connection, 10, "fact_contacts"),
                                     "November" => gapm(connection, 11, "fact_contacts"),
                                     "December" => gapm(connection, 12, "fact_contacts"),
                                   } },
                                    { name: "Quotes Requests", data: {
                                     "January" => gapm(connection, 1, "fact_quotes"),
                                     "February" => gapm(connection, 2, "fact_quotes"),
                                     "March" => gapm(connection, 3, "fact_quotes"),
                                     "April" => gapm(connection, 4, "fact_quotes"),
                                     "May" => gapm(connection, 5, "fact_quotes"),
                                     "June" => gapm(connection, 6, "fact_quotes"),
                                     "July" => gapm(connection, 7, "fact_quotes"),
                                     "August" => gapm(connection, 8, "fact_quotes"),
                                     "September" => gapm(connection, 9, "fact_quotes"),
                                     "October" => gapm(connection, 10, "fact_quotes"),
                                     "November" => gapm(connection, 11, "fact_quotes"),
                                     "December" => gapm(connection, 12, "fact_quotes"),
                                   } }]

    audio controls: true do
     source src: audio_path("/dashboard_audio.wav"), type: "audio/wav"
    end
    audio controls: true do
      source src: audio_path("/starwars_suck.wav"), type: "audio/wav"
    end
    panel "First and Second Question" do
     first_2_question
    end
    panel "Third Question" do
     line_chart [{ name: "Amount Of Elevator Per Customer", data: make_data_gebp_graph(connection) }]
    end
  end
end