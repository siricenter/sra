FactoryGirl.define do
    	factory :expense do |factory|
		factory.shoe_cost { Faker::Number.digit }
		factory.clothing_cost { Faker::Number.digit }
		factory.medical_cost { Faker::Number.digit }
		factory.school_cost { Faker::Number.digit }
		factory.college_cost { Faker::Number.digit }
		factory.utilities_cost { Faker::Number.digit }
		factory.misc_cost { Faker::Number.digit }

		factory.shoe_unit "day"
		factory.clothing_unit "day"
		factory.medical_unit "day"
		factory.school_unit "day"
		factory.college_unit "day"
		factory.utilities_unit "day"
		factory.misc_unit "day"
	end
end