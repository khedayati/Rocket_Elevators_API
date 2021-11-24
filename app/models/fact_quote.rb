class FactQuote < ActiveRecord::Base
#      ActiveRecord::Base.establish_connection(:data_warehouse)
    PgConnection::MyConnection
end
