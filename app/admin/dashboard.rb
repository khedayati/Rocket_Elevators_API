# frozen_string_literal: true
#= require chartkick

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

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    
    connection = PG::Connection.new(host:'***REMOVED***',port:'5432',dbname:'LEVY_POSTGRES',user:'***REMOVED***',password:'***REMOVED***')
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


    "hello"
      

        panel "First and Second Question" do
          first_2_question
        end
        panel "Third Question" do
          line_chart [{name: "Amount Of Elevator Per Customer", data: make_data_gebp_graph(connection)}]
        end
      # end
    # end
  end
end
