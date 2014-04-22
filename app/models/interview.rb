class Interview
	include Mongoid::Document
	embeds_one :health
	embeds_one :expense
	embeds_one :morbidity
	embeds_many :consumed_foods
	embeds_many :stored_foods
	embeds_many :purchased_foods

	field :household_id, type: Integer
	field :roof, type: String
	field :wall, type: String
	field :floor, type: String
	field :bedroom_count, type: Integer
	field :light, type: String
	field :fuel_type, type: String
	field :total_income, type: Integer
	field :income_unit, type: String
	field :radio, type: Boolean
	field :tv, type: Boolean
	field :refrigerator, type: Boolean
	field :created_at, type: Time, default: ->{Time.now}
end
