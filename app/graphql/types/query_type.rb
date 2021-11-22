# connection = PG::Connection.new(host: ENV["POSTGRESQL_DATABASE_HOST"], port: "5432", dbname: ENV["POSTGRESQL_DATABASE_DBNAME"], user: ENV["POSTGRESQL_DATABASE_USER"], password: ENV["POSTGRESQL_DATABASE_PASSWORD"])
module Types
  class QueryType < Types::BaseObject
    # # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    field :address, AddressType, null: true do
      argument :id, ID, required: true
    end
    field :customer, CustomerType, null: true do
      argument :id, ID, required: true
    end

    field :fact_intervention, FactInterventionType, null: true do
      argument :id, ID, required: true
    end

    # They will be entry points for queries on your schema.
    def customer(id:)
      Customer.find(id)
    end

    def address(id:)
      puts Address.find(id)
      Address.find(id)
      
    end

    def building_intervention(id:)
      building = Building.find(id)
      address = Address.find(building.address_id)
      {"building_address" => address}
    end

    def fact_intervention(id:)
      connection.execute("SELECT * FROM fact_interventions")[id]
    end



  end
end
