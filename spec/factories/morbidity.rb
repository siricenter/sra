FactoryGirl.define do
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
end