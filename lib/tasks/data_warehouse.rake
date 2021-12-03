# require File.expand_path(File.dirname(__FILE__) + "/../../config/environment.rb")
# require "pg"

# PsqlQuery = PgConnection::MyConnection
# puts "\e[0;36mCurrently connected to:\e[0m '" + ActiveRecord::Base.connection.current_database + "'"
# puts "\e[0;36mCurrently connected for PG to:\e[0m '" + PsqlQuery.dbname + "'"

# def get_total_ele(customer_id)
#   elevator_total = 0
#   Customer.find(customer_id).buildings.all.each do |building|
#     building.batteries.all.each do |battery|
#       battery.columns.all.each do |column|
#         column.elevators.all.each do |elevator|
#           elevator_total += 1
#         end
#       end
#     end
#   end
#   return elevator_total
# end

# def get_notes(status)
#   if status == "Incomplete"
#     # 25% of the intervention that are Incomplete will have notes
#     i = rand(1..4)
#     if i == 1
#       notes = Faker::Lorem.sentence(word_count: rand(5..15))
#     end
#     return notes
#   elsif status == "Fail"
#     # All fail intervention have notes
#     return Faker::Lorem.sentence(word_count: rand(5..30))
#   else
#     # 1/5 Success intervention have notes
#     i = rand(1..5)
#     if i == 1
#       notes = Faker::Lorem.sentence(word_count: rand(5..15))
#     end
#     return notes
#   end
# end

# def intervention_param(result)
#   # When Incomplete is the result then we do not want a intervention_end variable
#   if result == "Incomplete"
#     # Status that show a state of progession
#     status = ["Pending", "InProgress", "Resumed"].sample
#     intervention_start = Faker::Time.between(from: 730.days.ago, to: DateTime.now)
#     notes = get_notes(result)
#     return { "result" => result, "report" => notes, "status" => status, "intervention_start" => intervention_start, 'intervention_end': nil }
#   elsif result == "Fail"
#     # Status that show a state unspecified interuption
#     status = "Interrupted"
#     intervention_start = Faker::Time.between(from: 730.days.ago, to: DateTime.now)
#     notes = get_notes(result)
#     return { "result" => result, "report" => notes, "status" => status, "intervention_start" => intervention_start, "intervention_end" => nil }
#   else
#     status = "Complete"
#     intervention_start = Faker::Time.between(from: 730.days.ago, to: DateTime.now)
#     # Act like rand(1..15) but with weight toward number 1, 2 ,3 and 4
#     # Represent the interval between the start and end of an intervention
#     interval = [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 7, 8, 9, 15, 13, 6, 12].sample
#     intervention_end = Faker::Time.between(from: intervention_start, to: intervention_start + 86400 * interval)

#     notes = get_notes(result)
#     return { "result" => result, "report" => notes, "status" => status, "intervention_start" => intervention_start, "intervention_end" => intervention_end }
#   end
# end

# def get_result()
#   y = [1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3].sample
#   result = if y == 1 then "Success" elsif y == 2 then "Incomplete" else "Fail" end
# end

# namespace :wh do
#   task :reset do
#     Rake::Task["wh:make_table"].invoke
#     Rake::Task["wh:populate:quote"].invoke
#     Rake::Task["wh:populate:contact"].invoke
#     Rake::Task["wh:populate:elevator"].invoke
#     Rake::Task["wh:populate:customer"].invoke
#     Rake::Task["wh:populate:intervention"].invoke
#   end

#   task make_table: :environment do
#     PsqlQuery.execute("DROP TABLE IF EXISTS public.fact_quotes")
#     PsqlQuery.execute("CREATE TABLE public.fact_quotes (creation_date date NULL,
#             company_name varchar NULL,
#             email varchar NULL,
#             nb_elevator int4 NULL,
#             quote_id serial NOT NULL,
#             CONSTRAINT fact_quotes_pk PRIMARY KEY (quote_id))")
#     print "CREATE FACT QUOTE TABLE: "
#     puts "\e[0;32mOK\e[0m"

#     PsqlQuery.execute("DROP TABLE IF EXISTS public.fact_contacts")
#     PsqlQuery.execute("CREATE TABLE public.fact_contacts (creation_date date NULL,
#             company_name varchar NULL,
#             email varchar NULL,
#             project_name varchar NULL,
#             contact_id serial NOT NULL,
#             CONSTRAINT fact_contact_pk PRIMARY KEY (contact_id))")
#     print "CREATE FACT CONTACT TABLE: "
#     puts "\e[0;32mOK\e[0m"

#     PsqlQuery.execute("DROP TABLE IF EXISTS public.fact_elevators")
#     PsqlQuery.execute("CREATE TABLE public.fact_elevators (date_of_commissionig date NULL,
#             building_city varchar NULL,
#             customer_id serial NOT NULL,
#             building_id serial NOT NULL,
#             serial_number serial NOT NULL,
#             CONSTRAINT fact_elevator_pk PRIMARY KEY (serial_number))")
#     print "CREATE FACT ELEVATOR TABLE: "
#     puts "\e[0;32mOK\e[0m"

#     PsqlQuery.execute("DROP TABLE IF EXISTS public.dim_customers")
#     PsqlQuery.execute("CREATE TABLE public.dim_customers (creation_date date NULL,
#             company_name varchar NULL,
#             email varchar NULL,
#             full_name varchar NULL,
#             nb_elevator int4 NULL,
#             customer_city varchar NULL)")
#     print "CREATE DIM CUSTOMER TABLE: "
#     puts "\e[0;32mOK\e[0m"

#     PsqlQuery.execute("DROP TABLE IF EXISTS public.fact_interventions")
#     PsqlQuery.execute("CREATE TABLE public.fact_interventions (
#             intervention_id serial NOT NULL,
#             employee_id serial NOT NULL,
#             building_id serial NOT NULL,
#             battery_id int8,
#             column_id int8,
#             elevator_id int8,
#             intervention_start timestamp NOT NULL,
#             intervention_end timestamp NULL,
#             result varchar NOT NULL,
#             report varchar NULL,
#             status varchar NOT NULL)")
#     print "CREATE FACT INTERVENTIONS TABLE: "
#     puts "\e[0;32mOK\e[0m"
#     PsqlQuery.execute("DROP TABLE IF EXISTS public.fact_interventions")
#     PsqlQuery.execute("CREATE TABLE public.fact_interventions (
#                 intervention_id serial NOT NULL,
#                 employee_id serial NOT NULL,
#                 building_id serial NOT NULL,
#                 battery_id int8,
#                 column_id int8,
#                 elevator_id int8,
#                 intervention_start timestamp NOT NULL,
#                 intervention_end timestamp NULL,
#                 result varchar NOT NULL,
#                 report varchar NULL,
#                 status varchar NOT NULL,
#                 CONSTRAINT fact_interventions_pk PRIMARY KEY (intervention_id))")
#     print "CREATE FACT INTERVENTIONS TABLE: "
#     puts "\e[0;32mOK\e[0m"
#   end

#   namespace :populate do
#     task quote: :environment do
#       puts "Populate fact_quotes"
#       quote_bar = ProgressBar.create(:total => Quote.count)
#       Quote.all.each do |quote|
#         query = "insert into fact_quotes(quote_id,creation_date , company_name, email, nb_elevator ) values('#{quote.id}', '#{quote.created_at}','#{quote.company_name.gsub("'", "''")}', ' #{quote.email}',  '#{quote.amount_elevators}')"
#         PsqlQuery.execute(query)
#         quote_bar.increment
#       end
#       puts "POPULATE FACT QUOTE: " + "\e[0;32mOK\e[0m"
#     end

#     task contact: :environment do
#       puts "Populate fact_contacts"
#       lead_bar = ProgressBar.create(:total => Lead.count)
#       Lead.all.each do |contact|
#         query = "insert into fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{contact.id}', '#{contact.date_of_creation}', '#{contact.company_name}', '#{contact.email}', '#{contact.project_name}')"
#         PsqlQuery.execute(query)
#         lead_bar.increment
#       end
#       puts "POPULATE FACT CONTACT: " + "\e[0;32mOK\e[0m"
#     end
#     task elevator: :environment do
#       puts "Populate fact_elevators"
#       elevator_bar = ProgressBar.create(:total => Building.count)
#       Building.all.each do |building|
#         @address = Address.find(building.address_id)
#         building.batteries.all.each do |battery|
#           battery.columns.all.each do |column|
#             column.elevators.all.each do |elevator|
#               query = "insert into fact_elevators(serial_number, date_of_commissionig, building_city, customer_id, building_id) values('#{elevator.id}', '#{elevator.Date_of_commissioning}', '#{@address.city}', '#{building.customer.id}', '#{building.id}')"
#               PsqlQuery.execute(query)
#             end
#           end
#         end
#         elevator_bar.increment
#       end
      
#       puts "POPULATE FACT ELEVATOR: " + "\e[0;32mOK\e[0m"
#     end
#     task customer: :environment do
#       puts "Populate dim_customers"
#       customer_bar = ProgressBar.create(:total => Customer.count)
#       Customer.all.each do |customer|
#         query = "insert into dim_customers(creation_date, company_name, full_name, email, nb_elevator, customer_city) values('#{customer.customer_creation_date}', '#{customer.company_name.gsub("'", "''")}', '#{customer.full_name_of_the_company_contact.gsub("'", "''")}', '#{customer.email_of_the_company_contact}', '#{get_total_ele(customer.id)}', '#{customer.address.city}')"
#         PsqlQuery.execute(query)
#         customer_bar.increment
#       end
#       puts "POPULATE DIM CUSTOMER: " + "\e[0;32mOK\e[0m"
#     end
#     task intervention: :environment do
#       puts "Populate fact_interventions"
#       intervention_progressbar = ProgressBar.create(:total => Building.count)
#       Building.all.each do |building|
#         building_n_intervention = rand(0..2)
#         employee_id = building.batteries.first.employee_id
    
#         building_n_intervention.times do |intervention|
#           result = get_result()
#           intervention_params = intervention_param(result)
#           Intervention::Base.create(
#             intervention_params,
#             employee_id,
#             building.id
#           )
#         end
    
#         building.batteries.all.each do |battery|
#           battery_n_intervention = rand(0..2)
#           battery_n_intervention.times do |intervention|
#             result = get_result()
#             intervention_params = intervention_param(result)
#             Intervention::Base.create(
#               intervention_params,
#               employee_id,
#               building.id,
#               battery_id: battery.id
#             )
    
#           end
#           battery.columns.all.each do |column|
#             column_n_intervention = rand(0..2)
#             column_n_intervention.times do |intervention|
#               result = get_result()
#               intervention_params = intervention_param(result)
#               Intervention::Base.create(
#                 intervention_params,
#                 employee_id,
#                 building.id,
#                 battery_id: battery.id,
#                 column_id: column.id
#               )
#             end
#             column.elevators.all.each do |elevator|
#               elevator_n_intervention = rand(0..3)
#               elevator_n_intervention.times do |intervention|
#                 result = get_result()
#                 intervention_params = intervention_param(result)
#                 Intervention::Base.create(
#                   intervention_params,
#                   employee_id,
#                   building.id,
#                   battery_id: battery.id,
#                   column_id: column.id,
#                   elevator_id: elevator.id
#                 )
#               end
#             end
#           end
#         end
#         intervention_progressbar.increment
#       end
#     end
#   end
# end

# namespace :final do
#   task setup: :environment do
#     Rake::Task["db:reset"].invoke
#     print "RESET AND INIT MYSQL DATABASE: "
#     puts "\e[0;32mOK\e[0m"
#     Rake::Task["wh:reset"].invoke
#   end
# end

