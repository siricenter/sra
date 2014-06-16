FactoryGirl.define do
	factory :job do |factory|
		factory.person {FactoryGirl.build :person}
		factory.occupation {FactoryGirl.build :occupation}
	end
end