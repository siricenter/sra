class Expense
	include Mongoid::Document
	embedded_in :interview

	field :shoe_cost, type: Integer
	field :shoe_unit, type: String

	field :clothing_cost, type: Integer
	field :clothing_unit, type: String

	field :medical_cost, type: Integer
	field :medical_unit, type: String

	field :school_cost, type: Integer
	field :school_unit, type: String

	field :college_cost, type: Integer
	field :college_unit, type: String

	field :utilities_cost, type: Integer
	field :utilities_unit, type: String

	field :misc_cost, type: Integer
	field :misc_unit, type: String

	validates :shoe_cost, presence: true
	validates :clothing_cost, presence: true
	validates :medical_cost, presence: true
	validates :school_cost, presence: true
	validates :college_cost, presence: true
	validates :utilities_cost, presence: true
	validates :misc_cost, presence: true

	validates :shoe_unit, presence: true
	validates :clothing_unit, presence: true
	validates :medical_unit, presence: true
	validates :school_unit, presence: true
	validates :college_unit, presence: true
	validates :utilities_unit, presence: true
	validates :misc_unit, presence: true
end
