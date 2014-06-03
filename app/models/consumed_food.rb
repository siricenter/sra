class ConsumedFood
  include Mongoid::Document
  embedded_in :interview

  field :name, type: String
  field :amount, type: Integer
  field :unit, type: String

  validates :name, presence: true, format: {with: /\A[a-zA-Z ]+\z/}
  validates :amount, presence: true, numericality: true
  validates :unit, presence: true
end
