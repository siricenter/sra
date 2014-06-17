FactoryGirl.define do
factory :purchased_food do |factory|
		factory.name "Chard"
		factory.amount { Faker::Number.digit }
		factory.unit "kilograms"
		factory.frequency_amount { Faker::Number.digit }
		factory.time_unit "days"
	end
end