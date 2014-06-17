FactoryGirl.define do
factory :event do |factory|
		factory.title 'My big party'
		factory.start {Time.now}
		factory.user {User.last}
	end
end