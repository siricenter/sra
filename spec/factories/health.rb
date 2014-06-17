FactoryGirl.define do
    factory :health do |factory| 
		factory.bathroom_type "outhouse"
		factory.garbage_disposal "bury"
		factory.separate_kitchen true
		factory.sewage_disposal "outhouse"
		factory.water_source "piped"
		factory.water_chlorinated true
	end
end
