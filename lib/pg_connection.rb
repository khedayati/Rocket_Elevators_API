module PgConnection
    class Connection
        def initialize  
            @connection = PG::Connection.new(host: ENV["POSTGRESQL_DATABASE_HOST"], port: "5432", dbname: ENV["POSTGRESQL_DATABASE_DBNAME"], user: ENV["POSTGRESQL_DATABASE_USER"], password: ENV["POSTGRESQL_DATABASE_PASSWORD"])
        end

        def execute(statement)
            @connection.exec(statement)
        end

        def dbname
            @connection.db
        end


        attr_reader :connection
    end

    MyConnection = Connection.new
end

