# frozen_string_literal: true
#= require chartkick

require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson
# next_text = TextToSpeechV1.new(
#   authenticator: authenticator,
# )
# next_text.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/4a765487-f171-4f1d-9e6b-1b5f3cccd0b1"
# next_text.configure_http_client(disable_ssl_verification: true)

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  controller do
    def ibm_call
      authenticator = Authenticators::IamAuthenticator.new(
        apikey: ENV["IBM_API_TOKEN"],
      )
      text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator,
      )
      text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/4a765487-f171-4f1d-9e6b-1b5f3cccd0b1"
      text_to_speech.configure_http_client(disable_ssl_verification: true)
      begin
        File.open("public/dashboard_audio.wav", "wb") do |audio_file|
          response = text_to_speech.synthesize(
            text: get_text_to_speech_text,
            accept: "audio/wav",
            voice: "en-US_MichaelV3Voice",
          )
          audio_file.write(response.result)
        end
      rescue => exception
        if exception.to_s.split(",")[0] == "Error: Forbidden"
          render plain: "They free trial key has been fully used"
        elsif exception.to_s.split(",")[0] == "Error: Unauthorized"
          rend plain: "The api key is not authorized to perform this action"
        end
      else
        render plain: "It worked"
      end
    end

    # ---------------------- IBM WATSON HELPERS METHODS ----------------------
    def get_text_to_speech_data
      data = {}
      data["elevator_amount"] = Elevator.count
      data["customer_amount"] = Customer.count
      data["building_amount"] = Building.count
      data["stopped_elevators"] = Elevator.all.select { |elevator| elevator.status == "offline" }.count
      data["quote_amount"] = Quote.count
      data["lead_amount"] = Lead.count
      data["battery_amount"] = Battery.count
      data["city_amount"] = Address.select(:city).distinct.count
      return data
    end

    def get_text_to_speech_text
      data = get_text_to_speech_data
      first_line = "Greetings #{current_user}            \n"
      second_line = "There are currently #{data["elevator_amount"]} elevators deployed in the #{data["building_amount"]} buildings of your #{data["customer_amount"]} customers \n"
      third_line = "You currently have #{data["quote_amount"]} quote awaiting proccessing \n         "
      fourth_line = "You currently have #{data["lead_amount"]} leads in your contract request \n"
      last_line = "#{data["battery_amount"]} battery are deployed across #{data["city_amount"]} cities"

      text = first_line + second_line + third_line + fourth_line + last_line
    end
  end
  content title: proc { I18n.t("active_admin.dashboard") } do

    #  File.open("public/starwars_suck.wav", "wb") do |audio_file2|
    #    response2 = next_text.synthesize(
    #      text: "Liam Neeson was so eager to be in the film that he signed on without having read the script.
    #       During filming, Ewan McGregor made lightsaber noises as he dueled. George Lucas explained many times that the sound effects would be added in by the special effects people later on. Ewan said 'I kept getting carried away.'
    #        Qui-Gon Jinn's communicator is a redecorated Gillette Sensor Excel Razor for Women. ",
    #      accept: "audio/wav",
    #      voice: "en-US_MichaelV3Voice",
    #    )
    #    audio_file2.write(response2.result)
    #  end

    connection = PG::Connection.new(host: ENV["POSTGRESQL_DATABASE_HOST"], port: "5432", dbname: ENV["POSTGRESQL_DATABASE_DBNAME"], user: ENV["POSTGRESQL_DATABASE_USER"], password: ENV["POSTGRESQL_DATABASE_PASSWORD"])
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

    div "Hello #{current_user}", id: "Audio" do
    end
    audio controls: true do
      source src: audio_path("/dashboard_audio.wav"), type: "audio/wav"
    end
    div do
      render partial: "ibm_button"
    end
    div "StarWars" do
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
