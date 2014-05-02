require 'spec_helper'

describe Health do
	before :each do
		@health = FactoryGirl.build(:health)
	end

	it "should have a valid factory" do
		@health.should be_valid
	end

	it "should not be valid without a bathroom_type" do
		@health.bathroom_type = nil
		@health.should_not be_valid
	end

	it "should not be valid without a garbage_disposal" do
		@health.garbage_disposal = nil
		@health.should_not be_valid
	end

	it "should not be valid without a separate_kitchen" do
		@health.separate_kitchen = nil
		@health.should_not be_valid
	end

	it "should not be valid wihout a sewage_disposal" do
		@health.sewage_disposal = nil
		@health.should_not be_valid
	end

	it "should not be valid without a water_source" do
		@health.water_source = nil
		@health.should_not be_valid
	end

	it "should not be valid without a water_chlorinated" do
		@health.water_chlorinated = nil
		@health.should_not be_valid
	end

	it "should not be valid if sewage_disposal is not one of the valid options" do
		@health.sewage_disposal = "toilet"
		@health.should_not be_valid
	end
end
