class PurchasedFood
  include Mongoid::Document
  embedded_in :interview

  field :name, type: String
  field :amount, type: Integer
  field :unit, type: String
  field :frequency_amount, type: Integer
  field :time_unit, type: String
end
