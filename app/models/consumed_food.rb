class ConsumedFood
  include Mongoid::Document
  embedded_in :interview

  field :name, type: String
  field :amount, type: Integer
  field :unit, type: String

  validates :name, presence: true
end
