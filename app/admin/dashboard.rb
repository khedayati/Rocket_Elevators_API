# frozen_string_literal: true
#= require chartkick

require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

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
      next_text = TextToSpeechV1.new(
        authenticator: authenticator,
      )
      next_text.service_url = ENV["IBM_URL"]
      next_text.configure_http_client(disable_ssl_verification: true)

      text_to_speech.service_url = ENV["IBM_URL"]
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
        File.open("public/starwars_suck.wav", "wb") do |audio_file2|
          response2 = next_text.synthesize(
            text: "Liam Neeson was so eager to be in the film that he signed on without having read the script.
             During filming, Ewan McGregor made lightsaber noises as he dueled. George Lucas explained many times that the sound effects would be added in by the special effects people later on. Ewan said 'I kept getting carried away.'
              Qui-Gon Jinn's communicator is a redecorated Gillette Sensor Excel Razor for Women. ",
            accept: "audio/wav",
            voice: "en-US_MichaelV3Voice",
          )
          audio_file2.write(response2.result)
        end
      rescue => exception
        if exception.to_s.split(",")[0] == "Error: Forbidden"
          render plain: "They free trial key has been fully used"
        elsif exception.to_s.split(",")[0] == "Error: Unauthorized"
          rend plain: "The api key is not authorized to perform this action"
        end
      else
        render plain: "It worked!, please refresh the page to update the audio player"
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
    PsqlQuery = PgConnection::MyConnection
    first_2_question = column_chart [{ name: "Contacts Requests", data: {
                                      "January" => gapm(PsqlQuery, 1, "fact_contacts"),
                                      "February" => gapm(PsqlQuery, 2, "fact_contacts"),
                                      "March" => gapm(PsqlQuery, 3, "fact_contacts"),
                                      "April" => gapm(PsqlQuery, 4, "fact_contacts"),
                                      "May" => gapm(PsqlQuery, 5, "fact_contacts"),
                                      "June" => gapm(PsqlQuery, 6, "fact_contacts"),
                                      "July" => gapm(PsqlQuery, 7, "fact_contacts"),
                                      "August" => gapm(PsqlQuery, 8, "fact_contacts"),
                                      "September" => gapm(PsqlQuery, 9, "fact_contacts"),
                                      "October" => gapm(PsqlQuery, 10, "fact_contacts"),
                                      "November" => gapm(PsqlQuery, 11, "fact_contacts"),
                                      "December" => gapm(PsqlQuery, 12, "fact_contacts"),
                                    } },
                                     { name: "Quotes Requests", data: {
                                      "January" => gapm(PsqlQuery, 1, "fact_quotes"),
                                      "February" => gapm(PsqlQuery, 2, "fact_quotes"),
                                      "March" => gapm(PsqlQuery, 3, "fact_quotes"),
                                      "April" => gapm(PsqlQuery, 4, "fact_quotes"),
                                      "May" => gapm(PsqlQuery, 5, "fact_quotes"),
                                      "June" => gapm(PsqlQuery, 6, "fact_quotes"),
                                      "July" => gapm(PsqlQuery, 7, "fact_quotes"),
                                      "August" => gapm(PsqlQuery, 8, "fact_quotes"),
                                      "September" => gapm(PsqlQuery, 9, "fact_quotes"),
                                      "October" => gapm(PsqlQuery, 10, "fact_quotes"),
                                      "November" => gapm(PsqlQuery, 11, "fact_quotes"),
                                      "December" => gapm(PsqlQuery, 12, "fact_quotes"),
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
      line_chart [{ name: "Amount Of Elevator Per Customer", data: make_data_gebp_graph(PsqlQuery) }]
    end
  end
end
