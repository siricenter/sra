require 'spec_helper'

describe FamilyRelationship do
	before :each do
		@relationship = FactoryGirl.build(:family_relationship)
	end

	it "should have a valid factory" do
		@relationship.should be_valid
	end

	it "should not be valid without a name" do
		@relationship.name = nil
		@relationship.should_not be_valid
	end
end
