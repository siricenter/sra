FactoryGirl.define do
	factory :interview do |factory|
		factory.household_id { Faker::Number.digit }
		factory.roof "tin"
		factory.wall "brick"
		factory.floor "cement"
		factory.bedroom_count { Faker::Number.digit }
		factory.light true
		factory.fuel_type "gas"
		factory.total_income 500
		factory.radio true
		factory.tv false
		factory.refrigerator true
	end
end
