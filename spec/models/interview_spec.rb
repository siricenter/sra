require 'spec_helper'

describe Interview do
	before :each do
		@interview = FactoryGirl.build(:interview)
	end

	it "should have a valid factory" do
		@interview.should be_valid
	end

	it "should not be valid without a household_id" do
		@interview.household_id = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a roof" do
		@interview.roof = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a wall" do
		@interview.wall = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a floor" do
		@interview.floor = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a bedroom_count" do
		@interview.bedroom_count = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a light" do
		@interview.light = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a fuel_type" do
		@interview.fuel_type = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a total_income" do
		@interview.total_income = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a radio" do
		@interview.radio = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a tv" do
		@interview.tv = nil
		@interview.should_not be_valid
	end

	it "should not be valid without a refrigerator" do
		@interview.refrigerator = nil
		@interview.should_not be_valid
	end
end
