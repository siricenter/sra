FactoryGirl.define do
    factory :person do |factory|
		factory.given_name { Faker::Name.first_name }
		factory.family_name { Faker::Name.last_name }
		factory.birthday Time.now
		factory.education_level "some college"
		factory.gender "male"
		factory.in_school true
	end
end