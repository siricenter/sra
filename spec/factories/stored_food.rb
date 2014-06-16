FactoryGirl.define do 
	factory :stored_food do |factory|
		factory.name "Chard"
		factory.amount { Faker::Number.digit }
		factory.unit "kilograms"
	end
end
    