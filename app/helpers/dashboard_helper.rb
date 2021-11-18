require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson
module DashboardHelper

    # ---------------------- IBM WATSON HELPERS METHODS ----------------------
    # authenticator = Authenticators::IamAuthenticator.new(
    # apikey: ENV['IBM_API_TOKEN']
    # )
    # text_to_speech = TextToSpeechV1.new(
    # authenticator: authenticator
    # )
    # text_to_speech.service_url = "***REMOVED***"

    # text_to_speech.configure_http_client(disable_ssl_verification: true)


    
    # def get_text_to_speech_data
    #     data = {}
    #     data['elevator_amount'] = Elevator.count
    #     data['customer_amount'] = Customer.count
    #     data['building_amount'] = Building.count
    #     data['stopped_elevators'] = Elevator.all.select { |elevator| elevator.status == 'offline' }.count
    #     data['quote_amount'] = Quote.count
    #     data['lead_amount'] = Lead.count
    #     data['battery_amount'] = Battery.count
    #     data['city_amount'] = Address.select(:city).distinct.count
    #     return data
    # end

    # def get_text_to_speech_text
    #     data = get_text_to_speech_data
    #     first_line = "Greetings #{current_user}            \n"
    #     second_line = "There are currently #{data['elevator_amount']} elevators deployed in the #{data['building_amount']} buildings of your #{data['customer_amount']} customers \n"
    #     third_line = "You currently have #{data['quote_amount']} quote awaiting proccessing \n         "
    #     fourth_line = "You currently have #{data['lead_amount']} leads in your contract request \n"
    #     last_line = "#{data['battery_amount']} battery are deployed across #{data['city_amount']} cities"

    #     text = first_line + second_line + third_line + fourth_line + last_line
    # end
    # ---------------------- /IBM WATSON HELPERS METHODS ----------------------

    # ---------------------- DASHBOARD GRAPHS HELPERS METHOD ----------------------
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
    # ---------------------- /DASHBOARD GRAPHS HELPERS METHOD ----------------------

end
