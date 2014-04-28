require 'spec_helper'

describe StoredFood do
	before :each do
		@food = FactoryGirl.build(:stored_food)
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
end
