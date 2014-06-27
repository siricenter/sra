class Interview
	include Mongoid::Document
	embeds_one :health
	embeds_one :expense
	embeds_one :morbidity
	embeds_many :consumed_foods
	embeds_many :stored_foods
	embeds_many :purchased_foods

	field :bedroom_count, type: Integer
	field :created_at, type: Time, default: ->{Time.now}
	field :floor, type: String
	field :fuel_type, type: String
	field :household_id, type: Integer
	field :income_unit, type: String
	field :light, type: Boolean
	field :radio, type: Boolean
	field :refrigerator, type: Boolean
	field :roof, type: String
	field :total_income, type: Integer
	field :tv, type: Boolean
	field :wall, type: String

	validates :bedroom_count, presence: true
	validates :floor, presence: true
	validates :household_id, presence: true
	validates :light, presence: true
	validates :roof, presence: true
	validates :wall, presence: true
	validates :fuel_type, presence: true
	validates :total_income, presence: true
	validates :radio, presence: true
	validates :tv, presence: true
	validates :refrigerator, presence: true

	def calories
		calories = 0
		self.consumed_foods.each do |food|
			calories += food.calories
		end

		return calories
	end
end
