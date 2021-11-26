class FactQuote < ActiveRecord::Base
#      ActiveRecord::Base.establish_connection(:data_warehouse)
    establish_connection(:data_warehouse)
end
