# frozen_string_literal: true
#= require chartkick

def gapm(connection, month, table)
  # Get amount per month
  connection.exec("SELECT * FROM #{table} WHERE extract(month FROM creation_date) = #{month}").ntuples
end



def make_data_gebp_graph(connection)
  # @amount_of_elevator = connection.exec("SELECT * FROM fact_elevators").ntuples
  @max = connection.exec("SELECT MAX(nb_elevator) FROM dim_customers").to_a[0]['max'].to_i
  @min = connection.exec("SELECT MIN(nb_elevator) FROM dim_customers").to_a[0]['min'].to_i
  @amount_customers = connection.exec("SELECT * FROM dim_customers").count
  @amount_of_elevator.times do |i|

  end

end

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    
    connection = PG::Connection.new(host:'localhost',port:'5432',dbname:'data_warehouse',user:'yen',password:'password')
    test = column_chart [{name: "Contacts Requests", data: {
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

    # line_chart [{name: "foo", data: {"test": 4}}]
                    
    # column_chart [{test: 1}, {test: 2}, {test: 3}]
    
    
    # Here is an example of a simple dashboard with columns and panels.
    
    "hello"
      columns do
        panel "Info" do
          test
        end
        panel "Infoa" do
          line_chart [{name: "foo", data: {"test": 4}}]
        end
      end
    # end
  end
end
