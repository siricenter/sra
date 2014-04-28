require 'spec_helper'

describe Expense do
	before :each do
		@food = FactoryGirl.build(:expense)
	end

	it "should have a valid factory" do
		@food.should be_valid
	end

	it "should not be valid without a shoe_cost" do
		@food.shoe_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a clothing_cost" do
		@food.clothing_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a medical_cost" do
		@food.medical_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a school_cost" do
		@food.school_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a college_cost" do
		@food.college_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a utilities_cost" do
		@food.utilities_cost = nil
		@food.should_not be_valid
	end

	it "should not be valid without a misc_cost" do
		@food.misc_cost = nil
		@food.should_not be_valid
	end


	it "should not be valid without a shoe_unit" do
		@food.shoe_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a clothing_unit" do
		@food.clothing_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a medical_unit" do
		@food.medical_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a school_unit" do
		@food.school_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a college_unit" do
		@food.college_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a utilities_unit" do
		@food.utilities_unit = nil
		@food.should_not be_valid
	end

	it "should not be valid without a misc_unit" do
		@food.misc_unit = nil
		@food.should_not be_valid
	end
end
