module Types
  class FactInterventionType < Types::BaseObject
    field :employee_id, ID, null: false
    field :building_id, ID, null: false
    field :battery_id, ID, null: true
    field :column_id, ID, null: true
    field :elevator_id, ID, null: true
    field :start_date_of_intervention, GraphQL::Types::ISO8601DateTime, null: false
    field :end_date_of_intervention, GraphQL::Types::ISO8601DateTime, null: true
    field :result, String, null: false
    field :report, String, null: true
    field :status, String, null: false
  end
end
