class PurchasedFood
  include Mongoid::Document
  embedded_in :interview

  field :name, type: String
  field :amount, type: Integer
  field :unit, type: String
  field :frequency_amount, type: Integer
  field :time_unit, type: String

  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :unit, presence: true
  validates :frequency_amount, presence: true
  validates :time_unit, presence: true
end
