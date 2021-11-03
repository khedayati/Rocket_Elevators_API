# frozen_string_literal: true

json.array! @quotes, partial: 'quotes/quote', as: :quote
