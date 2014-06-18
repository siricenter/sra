require 'spec_helper'

describe Person do
	before :each do
		@person = FactoryGirl.build :person
	end
	
	it "has a valid factory" do
		@person.should be_valid
	end
	
	it "is valid when the person is not in school" do
		@person.in_school = "0"
		@person.should be_valid
	end
end