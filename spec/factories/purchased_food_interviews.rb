FactoryGirl.define do
factory :purchased_food_interview, class: :interview do |factory|
		factory.household_id { Faker::Number.digit }
		factory.purchased_foods {[FactoryGirl.build(:purchased_food)]}
	end
end