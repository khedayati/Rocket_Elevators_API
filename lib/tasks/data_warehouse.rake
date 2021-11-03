require File.expand_path(File.dirname(__FILE__) + '/../../config/environment.rb')
require 'pg'

# Establish a connection to the database data_warehouse.
# Should work for all the namespace -> task included in the file.
# db = ActiveRecord::Base.establish_connection(:data_warehouse)
# ActiveRecord::Base.establish_connection(:development)
# db = PG::connect.open( :port => '5432', :dbname => 'data_warehouse' , :user => 'yen', :password => 'password')
connection = PG::Connection.new(host:'localhost',port:'5432',dbname:'data_warehouse',user:'yen',password:'password')

puts "\e[0;36mCurrently connected to:\e[0m '" + ActiveRecord::Base.connection.current_database + "'"
puts "\e[0;36mCurrently connected for PG to:\e[0m '" + connection.db + "'"

# ActiveRecord::Base.logger = Logger.new(STDOUT)




namespace :wh do
    task make_table: :environment do
        connection.exec("DROP TABLE IF EXISTS public.fact_quotes")
        connection.exec("CREATE TABLE public.fact_quotes (creation_date date NULL,
        company_name varchar NULL,
        email varchar NULL,
        nb_elevator int4 NULL,
        quote_id serial NOT NULL,
        CONSTRAINT fact_quotes_pk PRIMARY KEY (quote_id))")
        print "CREATE FACT QUOTE TABLE: "
        puts "\e[0;32mOK\e[0m"

        connection.exec("DROP TABLE IF EXISTS public.fact_contacts")
        connection.exec("CREATE TABLE public.fact_contacts (creation_date date NULL,
        company_name varchar NULL,
        email varchar NULL,
        project_name varchar NULL,
        contact_id serial NOT NULL,
        CONSTRAINT fact_contact_pk PRIMARY KEY (contact_id))")
        print "CREATE FACT CONTACT TABLE: "
        puts "\e[0;32mOK\e[0m"

        connection.exec("DROP TABLE IF EXISTS public.fact_elevators")
        connection.exec("CREATE TABLE public.fact_elevators (date_of_commissionnig date NULL,
        building_city varchar NULL,
        customer_id serial NOT NULL,
        building_id serial NOT NULL,
        serial_number serial NOT NULL,
        CONSTRAINT fact_elevator_pk PRIMARY KEY (serial_number))")
        print "CREATE FACT ELEVATOR TABLE: "
        puts "\e[0;32mOK\e[0m"
            

        connection.exec("DROP TABLE IF EXISTS public.dim_customers")
        connection.exec("CREATE TABLE public.dim_customers (creation_date date NULL,
        company_name varchar NULL,
        email varchar NULL,
        full_name varchar NULL,
        nb_elevator int4 NULL,
        customer_city varchar NULL)")
        print "CREATE DIM CUSTOMER TABLE: "
        puts "\e[0;32mOK\e[0m"
    end

    namespace :populate do
        task quote: :environment do
            Quote.all.each do |quote|
                query = "insert into fact_quotes(quote_id,creation_date , company_name, email, nb_elevator ) values('#{quote.id}', '#{quote.created_at}',' #{"foo"}', '#{"bar"}', '#{quote.amount_elevators}')"
                connection.exec(query)
            end
        end

        task contact: :environment do
            Lead.all.each do |contact|
                # query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
            end
        end
        task elevator: :environment do
            Building.all.each do |b|
                b.Battery.all.each do |ba|

                    Elevator.all.each do |elevator|
                        # query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                        query = "insert into fact_contacts(serial_number, date_of_commissionnig, building_city, customer_id, building_id) values('#{elevator.id}', '#{elevator.created_at}', '#{elevator.building_city}', '#{elevator.email}', '#{elevator.project_name}')"
                    end
                end
            end
        end
        task customer: :environment do
            Customer.all.each do |contact|
                # query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.created_at}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
            end
        end
    end
end
