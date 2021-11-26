=begin
  How to use? 
  Intervention::Base.create(*args)
    *args: employee_id
          building_id
          battery_id
          column_id
          elevator_id
          intervention_start
          intervention_end
          result
          report
          status

  it will change the whole args into a hash to be passed to the method insert wich will then
  push the verify the integrity of the data and insert it into the database.


  So this is the equivalent of the following statement: Model.create(params)
  but for the fact_interventions table in the postgre database.


  I'm sure it could be much shorter but, fuck you.
=end

module Intervention
  class CreateFakeData
    def initialize
    end

    def raise_error(data)
      raise CannotBeNullError.new($!), "data['employee_id'] expected to be an integer > 0 but was '#{data["employee_id"]}'" if [nil, 0, ""].any? { |employee| employee == data["employee_id"] }
      raise CannotBeNullError.new($!), "data['building_id'] expected to be an integer > 0 but was '#{data["building_id"]}'" if [nil, 0, ""].any? { |building| building == data["building_id"] }
      raise CannotBeNullError.new($!), "data['intervention_start'] expected to be a timestamp but was '#{data["intervention_start"]}'" if [nil, 0, ""].any? { |intervention| intervention == data["intervention_start"] }
      raise WrongStatusError.new($!), "data['result'] expected to be something between Success, Fail, Incomplete but was '#{data["result"]}'" if ["Success", "Fail", "Incomplete"].none? { |result| result == data["result"] }
      raise WrongStatusError.new($!), "data['status'] expected to be something between Pending, InProgress, Interrupted, Resumed, Complete but was '#{data["status"]}'" if ["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].none? { |status| status == data["status"] }
    end

    def insert(data)
      raise_error(data)

      string1 = "INSERT INTO fact_interventions(employee_id, building_id,"

      if data["battery_id"] != nil
        string1 << "battery_id,"

        if data["column_id"] != nil
          string1 << "column_id,"

          if data["elevator_id"] != nil
            string1 << "elevator_id,"
          end
        end
      end
      string1 << "intervention_start,"

      if data["intervention_end"] != nil
        string1 << "intervention_end,"
      end

      string1 << "result,"

      if data["report"] != nil
        string1 << "report,"
      end

      string1 << "status)"

      string2 = "VALUES('#{data["employee_id"]}', '#{data["building_id"]}',"

      if data["battery_id"] != nil
        string2 << "'#{data["battery_id"]}',"

        if data["column_id"] != nil
          string2 << "'#{data["column_id"]}',"

          if data["elevator_id"] != nil
            string2 << "'#{data["elevator_id"]}',"
          end
        end
      end
      string2 << "'#{data["intervention_start"]}',"

      if data["intervention_end"] != nil
        string2 << "'#{data["intervention_end"]}',"
      end

      string2 << "'#{data["result"]}',"

      if data["report"] != nil
        string2 << "'#{data["report"]}',"
      end

      string2 << "'#{data["status"]}')"

      PgConnection::MyConnection.execute(string1 + string2)
    end

    def create(
      params,
      employee_id,
      building_id,
      battery_id: nil,
      column_id: nil,
      elevator_id: nil
    )
      data = { "employee_id" => employee_id,
               "building_id" => building_id,
               "battery_id" => battery_id,
               "column_id" => column_id,
               "elevator_id" => elevator_id,
               "intervention_start" => params["intervention_start"],
               "intervention_end" => params["intervention_end"],
               "result" => params["result"],
               "report" => params["report"],
               "status" => params["status"], }
      insert(data)
    end
  end

  Base = CreateFakeData.new
end
