FactoryGirl.define do
    
	factory :household do |factory|
		factory.name { Faker::Name.last_name }
		user
	end
end