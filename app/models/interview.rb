class Interview
	include Mongoid::Document

	field :roof, type: String
	field :wall, type: String
	field :floor, type: String
	field :bedroom_count, type: Integer
	field :separate_kitchen, type: Boolean
	field :light, type: String
	field :fuel_type, type: String
	field :water_source, type: String
	field :water_chlorinated, type: Boolean
	field :bathroom, type: String
	field :sewage, type: String
	field :person_count, type: Integer
	field :total_income, type: Integer
	field :income_unit, type: String
	field :shoe_cost, type: Integer
	field :shoe_unit, type: String
	field :medicine_cost, type: Integer
	field :medicine_unit, type: String
	field :school_cost, type: Integer
	field :school_unit, type: String
	field :college_cost, type: Integer
	field :college_unit, type: String
	field :water_electric_cost, type: Integer
	field :water_electric_unit, type: String
	field :misc_cost, type: Integer
	field :misc_unit, type: String
	field :radio, type: Boolean
	field :tv, type: Boolean
	field :refrigerator, type: Boolean
	field :created_at, type: Time, default: ->{Time.now}
end
