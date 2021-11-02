# frozen_string_literal: true

json.extract! quote, :id, :building_type, :amount_elevators, :product_line, :installation_fees, :total_cost,
              :created_at, :updated_at
json.url quote_url(quote, format: :json)
