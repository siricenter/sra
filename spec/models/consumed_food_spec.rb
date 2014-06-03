require 'spec_helper'
require 'factory_girl'

describe ConsumedFood do
	before :each do
		@food = FactoryGirl.build(:consumed_food)
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	it "has a valid factory" do
		@food.should be_valid
	end

	it "is invalid without a name" do
		@food.name = nil
		@food.should_not be_valid
	end

	it "is invalid without an amount" do
		@food.amount = nil
		@food.should_not be_valid
	end

	it "is invalid without a unit" do
		@food.unit = nil
		@food.should_not be_valid
	end

	it "is invalid if the name has a number" do
		@food.name = "abc1def"
		@food.should_not be_valid
	end

	it "is invalid if the amount is not an integer" do
		@food.amount = "string"
		@food.should_not be_valid
	end
end
