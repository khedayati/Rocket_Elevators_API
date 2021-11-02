# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_names = Array['Nicolas', 'Nadya', 'Martin', 'Mathieu', 'Patrick', 'David', 'Mathieu', 'Thomas', 'Serge',
                    'Francis', 'Mathieu', 'David', 'Nicolas', 'David', 'Remi', 'Timothy', 'Kiril', 'Emmanuela', 'Abdul', 'Krista', 'Jonathan']
last_names = Array['Genest', 'Fortier', 'Chantal', 'Houde', 'Tibault', 'Boutin', 'Lortie', 'Carrier', 'Savoie',
                   'Patry-Jessop', 'Lefrancois', 'Larochelle', 'Pineault', 'Amyot', 'Gagnon', 'Wever', 'Kleinerman', 'Derilus', 'Akeeb', 'Sheely', 'Murray']
functions = Array['CEO', 'Director', 'Assistant Director', 'Captain', 'Captain', 'Engineer', 'Engineer', 'Engineer',
                  'Engineer', 'Engineer', 'Engineer', 'Engineer', 'Engineer', 'Engineer', 'Engineer', 'Developer', 'Developer', 'Developer', 'Developer', 'Developer', 'Developer']
emails = Array['nicolas.genest@***REMOVED***.biz', 'nadya.fortier@***REMOVED***.biz', 'martin.chantal@***REMOVED***.biz',
               'mathieu.houde@***REMOVED***.biz', 'patrick.thibault@***REMOVED***.biz', 'david.boutin@***REMOVED***.biz', 'mathieu.lortie@***REMOVED***.biz', 'thomas.carrier@***REMOVED***.biz', 'serge.savoie@***REMOVED***.biz', 'francis.patry-jessop@***REMOVED***.biz', 'mathieu.lefrancois@***REMOVED***.biz', 'david.larochelle@***REMOVED***.biz', 'nicolas.pineault@***REMOVED***.biz', 'david.amyot@***REMOVED***.biz', 'remi.gagnon@***REMOVED***.biz', 'timothy.wever@***REMOVED***.biz', 'kiril.kleinerman@***REMOVED***.biz', 'emmanuela.derilus@***REMOVED***.biz', 'abdul.akeeb@***REMOVED***.biz', 'krista.sheely@***REMOVED***.biz', 'jonathan.murray@***REMOVED***.biz']

# for i in 0...first_name.length()
#     @user = User.create!(email: email[i], password: 'password', password_confirmation: 'password', first_name:first_name[i], last_name:last_name[i], function:function[i])
#     puts @user
#     Employee.create!(first_name:first_name[i], last_name:last_name[i], function:function[i], email:email[i])
# end

first_names.each_with_index do |first_name, index|
  puts index
  puts first_name

  @user = User.create(email: emails[index],
                      password: 'password',
                      password_confirmation: 'password',
                      first_name: first_names[index],
                      last_name: last_names[index],
                      function: functions[index])

  next unless @user&.valid?

  puts 'will create employee'
  Employee.create!(first_name: first_names[index], last_name: last_names[index], function: functions[index],
                   email: emails[index], user: @user)
end

# Leads Table Dataset
leads_first_name = Faker::Name.unique.first_name
leads_last_name = Faker::Name.unique.last_name
leads_email = Faker::Internet.unique.email
leads_phone = Faker::PhoneNumber.unique.cell_phone
leads_project_name = Faker::Lorem.unique.words
leads_project_description = Faker::Lorem.unique.sentence
leads_department = Faker::Company.unique.industry
leads_message = Faker::Lorem.unique.sentence
leads_project_description = Faker::Lorem.unique.sentence

# puts leads_first_name
# puts leads_last_name
# puts leads_email
# puts leads_phone
# puts leads_project_description
# puts leads_department
# puts leads_message
# puts leads_project_description

# Adress Table Dataset
address_type = Array['Residential', 'Commercial', 'Corporate', 'Hybrid']
street_number = Faker::Address.unique.full_address
building_type = Array['Suite', 'Apartment']
city = Faker::Address.city
postal_code = Faker::Address.postcode
country = Faker::Address.country
adress_notes = Faker::Lorem.unique.sentence

# Customers Table Dataset
company_name = Faker::Company.unique.name
company_adress = Faker::Address.unique.full_address
company_contact = Faker::Name.unique.name
company_contact_phone = Faker::PhoneNumber.unique.cell_phone

# puts company_name
# puts company_name
# puts company_adress
# puts company_contact
# puts company_contact_phone

# Buildings Table Dataset
building_adress = Faker::Address.unique.full_address
building_name = Faker::Company.unique.name
building_email = Faker::Internet.unique.email
building_phone = Faker::PhoneNumber.unique.cell_phone
technical_contact_name = Faker::Name.unique.name
technical_contact_email = Faker::Internet.unique.email
technical_contact_phone = Faker::PhoneNumber.unique.cell_phone

# BuildingDetails Table Dataset
information_key = Array[type: Array['Residential', 'Commercial', 'Corporate', 'Hybrid'], construction_year:"1999"]
puts information_key

# Batteries Table Dataset
batteries_type = Array['Residential', 'Commercial', 'Corporate', 'Hybrid']
batteries_status = 'online'
batteries_informations = Faker::Lorem.unique.sentence
batteries_notes = Faker::Lorem.unique.sentence

# Columns Table Dataset
columns_type = Array['Residential', 'Commercial', 'Corporate']

# Elevators Table Dataset
serial_number = Faker::Device.unique.serial
model = Array['Standard', 'Premium', 'Excelium']
elevators_type = Array['Residential', 'Commercial', 'Corporate']
elevators_status = 'online'
elevators_information = Faker::Lorem.unique.sentence
elevators_notes = Faker::Lorem.unique.sentence
