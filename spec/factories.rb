require 'faker'

FactoryGirl.define do
	factory :consumed_food do |factory|
		factory.name "Chard"
		factory.amount { Faker::Number.digit }
		factory.unit "kilograms"
	end

	factory :stored_food do |factory|
		factory.name "Chard"
		factory.amount { Faker::Number.digit }
		factory.unit "kilograms"
	end

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

	factory :family_relationship do |factory|
		factory.name "father"
	end

	factory :health do |factory| 
		factory.bathroom_type "outhouse"
		factory.garbage_disposal "bury"
		factory.separate_kitchen true
		factory.sewage_disposal "outhouse"
		factory.water_source "piped"
		factory.water_chlorinated true
	end

	factory :household do |factory|
		factory.name { Faker::Name.last_name }
	end

	factory :morbidity do |factory|
		factory.child_sickness_frequency { Faker::Number.digit }
		factory.child_sickness_time "day" 
		factory.child_aid "doctor"
		factory.child_common_ailment "influenza"

		factory.adult_sickness_frequency { Faker::Number.digit }
		factory.adult_sickness_time "day" 
		factory.adult_aid "doctor"
		factory.adult_common_ailment "influenza"
	end

	factory :occupation do |factory|
		factory.name "Farmer"
	end

	factory :person do |factory|
		factory.given_name { Faker::Name.first_name }
		factory.family_name { Faker::Name.last_name }
		factory.birthday Time.now
		factory.education_level "some college"
		factory.gender "male"
		factory.in_school true
	end
end
