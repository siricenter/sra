FactoryGirl.define do
    factory :email do |factory|
		factory.email { Faker::Internet.email }
		factory.password "abc123456"
		factory.password_confirmation "abc123456"
	end
end