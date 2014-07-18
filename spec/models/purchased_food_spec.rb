require 'spec_helper'

describe PurchasedFood do
	before :each do
		DatabaseCleaner[:mongoid].start
		@food = FactoryGirl.build(:purchased_food)
	end
	
	after :each do
		DatabaseCleaner[:mongoid].clean
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

	it "shouldn't be valid without a frequency_amount" do
		@food.frequency_amount = nil
		@food.should_not be_valid
	end

	it "shouldn't be valid without a time_unit" do
		@food.time_unit = nil
		@food.should_not be_valid
	end

	it "shouldn't be valid with a duplicate name" do
		interview = FactoryGirl.create(:interview)
		first = FactoryGirl.build(:purchased_food)
		second = FactoryGirl.build(:purchased_food)

		interview.purchased_foods << first
		interview.should be_valid

		interview.purchased_foods << second
		interview.should_not be_valid
		second.should_not be_valid
	end
end
