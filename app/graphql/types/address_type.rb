module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :type_of_address, String, null: true
    field :status, String, null: true
    field :entity, String, null: true
    field :number_and_street, String, null: true
    field :suite_or_apartment, String, null: true
    field :city, String, null: true
    field :postal_code, String, null: true
    field :country, String, null: true
    field :notes, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :longitude, Float, null: true
    field :latitude, Float, null: true
  end
end
