json.extract! fact_intervention, :id, :author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_end, :result, :report, :status, :created_at, :updated_at
json.url fact_intervention_url(fact_intervention, format: :json)
