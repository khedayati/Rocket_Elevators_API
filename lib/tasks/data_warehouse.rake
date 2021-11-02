
namespace :wh do
    task :migrate do
        db = ActiveRecord::Base.establish_connection(  
        adapter: "postgresql",
        encoding: "utf8",
        database: "data_warehouse",
        username: "yen",
        password: "password",
        port: 5432
        )
        db.connection.create_table :fact_quotes, force: true do |t|
            t.bigint "quote_id"
            t.string "company_name"
            t.string "email"
            t.bigint "nb_elevator"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
        end

        db.connection.create_table :fact_contacts, force: true do |t|
            t.bigint "contact_id"
            t.string "company_name"
            t.string "email"
            t.string "project_name"
            t.datetime "created_at", null: false
            t.datetime "updated_at", null: false
        end

        db.connection.create_table :fact_elevators, force: true do |t|
            t.bigint "serial_number"
            t.datetime "date_of_commissionnig", null: false
            t.bigint "building_id"
            t.bigint "customer_id"
            t.string "building_city"
        end

        db.connection.create_table :dim_customers, force: true do |t|
            t.datetime "created_at", null: false
            t.string "company_name"
            t.string "full_name_company_contact"
            t.string "email_company_contact"
            t.bigint "nb_elevator"
            t.string "customer's_city"
        end

    end
end