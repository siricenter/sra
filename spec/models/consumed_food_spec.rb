require 'spec_helper'
require 'factory_girl'

describe ConsumedFood do
	before :each do
		@food = FactoryGirl.build(:consumed_food)
	end

	it "should have a valid factory" do
		@food.should be_valid
	end

	it "shouldn't be valid without a name" do
		@food.name = nil
		@food.should_not be_valid
	end

	it "shouldn't be valid without an amount" do
		@food.amount = nil
		@food.should_not be_valid
	end

	it "shouldn't be valid without a unit" do
		@food.unit = nil
		@food.should_not be_valid
	end

	it "shouldn't be valid if the name has a number" do
		@food.name = "abc1def"
		@food.should_not be_valid
	end

	it "shouldn't be valid if the amount is not an integer" do
		@food.amount = "string"
		@food.should_not be_valid
	end
	
	it "requires 'unit' to be grams or kilograms" do
		@food.unit = "something_else"
		@food.should_not be_valid
	end
end
