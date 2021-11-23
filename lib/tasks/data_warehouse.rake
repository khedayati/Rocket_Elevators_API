require File.expand_path(File.dirname(__FILE__) + '/../../config/environment.rb')
require 'pg'


connection = PG::Connection.new(host: ENV["POSTGRESQL_DATABASE_HOST"], port: "5432", dbname: ENV["POSTGRESQL_DATABASE_DBNAME"], user: ENV["POSTGRESQL_DATABASE_USER"], password: ENV["POSTGRESQL_DATABASE_PASSWORD"])

puts "\e[0;36mCurrently connected to:\e[0m '" + ActiveRecord::Base.connection.current_database + "'"
puts "\e[0;36mCurrently connected for PG to:\e[0m '" + connection.db + "'"


def get_total_ele( customer_id)
    elevator_total = 0
    Customer.find(customer_id).buildings.all.each do |building|
        building.batteries.all.each do |battery|
            battery.columns.all.each do |column|
                column.elevators.all.each do |elevator|
                    elevator_total += 1
                end
            end
        end
    end
    return elevator_total
end


namespace :wh do
    task :reset do
        Rake::Task["wh:make_table"].invoke
        Rake::Task["wh:populate:quote"].invoke
        Rake::Task["wh:populate:contact"].invoke
        Rake::Task["wh:populate:elevator"].invoke
        Rake::Task["wh:populate:customer"].invoke
    end




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
            connection.exec("CREATE TABLE public.fact_elevators (date_of_commissionig date NULL,
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


            connection.exec("DROP TABLE IF EXISTS public.fact_interventions")
            connection.exec("CREATE TABLE public.fact_interventions (
            employee_id serial NOT NULL,
            building_id serial NOT NULL,
            battery_id int8,
            column_id int8,
            elevator_id int8,
            intervention_start timestamp NOT NULL,
            intervention_end timestamp NULL,
            result varchar NOT NULL,
            report varchar NULL,
            status varchar NOT NULL)")
            print "CREATE FACT INTERVENTIONS TABLE: "
            puts "\e[0;32mOK\e[0m"
        end

        namespace :populate do
            task quote: :environment do
                Quote.all.each do |quote|
                    query = "insert into fact_quotes(quote_id,creation_date , company_name, email, nb_elevator ) values('#{quote.id}', '#{quote.created_at}',' #{quote.email}', '#{quote.company_name.gsub("'", "''")}', '#{quote.amount_elevators}')"
                connection.exec(query)
                end
                puts "POPULATE FACT QUOTE: " + "\e[0;32mOK\e[0m"
            end


        task contact: :environment do
            Lead.all.each do |contact|
                query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.date_of_creation}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
                connection.exec(query)
            end
            puts "POPULATE FACT CONTACT: " + "\e[0;32mOK\e[0m"
        end
        task elevator: :environment do
            

            Building.all.each do |building|
                @address = Address.find(building.address_id)
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        column.elevators.all.each do |elevator|
                            query = "insert into fact_elevators(serial_number, date_of_commissionig, building_city, customer_id, building_id) values('#{elevator.id}', '#{elevator.Date_of_commissioning}', '#{@address.city}', '#{building.customer.id}', '#{building.id}')"
                            connection.exec(query)
                        end
                    end
                end
            end

            puts "POPULATE FACT ELEVATOR: " + "\e[0;32mOK\e[0m"
        end
        task customer: :environment do
            Customer.all.each do |customer|
                query = "insert into dim_customers(creation_date, company_name, full_name, email, nb_elevator, customer_city) values('#{customer.customer_creation_date}', '#{customer.company_name.gsub("'", "''")}', '#{customer.full_name_of_the_company_contact.gsub("'", "''")}', '#{customer.email_of_the_company_contact}', '#{get_total_ele(customer.id)}', '#{customer.address.city}')"
                connection.exec(query)
            end
            puts "POPULATE DIM CUSTOMER: " + "\e[0;32mOK\e[0m"
        end
    end
end



namespace :final do
    task setup: :environment do
        Rake::Task["db:reset"].invoke
        print "RESET AND INIT MYSQL DATABASE: "
        puts "\e[0;32mOK\e[0m"
        Rake::Task["wh:reset"].invoke
    end
end
