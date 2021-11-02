class DataWarehouseBase < ActiveRecord::Base
    self.abstract_class = true
    ActiveRecord::Base.establish_connection(  
        adapter: "postgresql",
        encoding: "utf8",
        database: "data_warehouse",
        username: "yen",
        password: "password",
        port: 5432
    )
end

class FactQuote < DataWarehouseBase
  belongs_to :quote
    connection.create_table table_name, force: true do |t|
        t.bigint "quote_id"
        t.string "company_name"
        t.string "email"
        t.bigint "nb_elevator"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        puts "finished"
    end
end

class FactElevator < DataWarehouseBase
  belongs_to :elevator
  belongs_to :building
end

class FactContact < DataWarehouseBase
  belongs_to :contact
end

