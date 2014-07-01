require 'spec_helper'
require 'factory_girl'

describe ConsumedFood do
	before :each do
		DatabaseCleaner.start
		@food = FactoryGirl.build(:consumed_food)
	end

	after :each do
		DatabaseCleaner.clean
	end

	it "has a valid factory" do
		@food.should be_valid
	end

	it "is invalid without a UID" do
		@food.n_id = nil
		@food.should_not be_valid
	end

	it "is invalid without a number of servings" do
		@food.servings = nil
		@food.should_not be_valid
	end

	it "is invalid if the number of servings is not a number" do
		@food.servings = "abc"
		@food.should_not be_valid
	end

	it "is invalid if the number of servings is negative" do
		@food.servings = -1
		@food.should_not be_valid
	end

	it "is invalid if the number of servings is not positive" do
		@food.servings = 0
		@food.should_not be_valid
	end

	it "is valid if the frequency is 'daily'" do
		@food.frequency = 'daily'
		@food.should be_valid
	end

	it "is valid if the frequency is 'weekly'" do
		@food.frequency = 'weekly'
		@food.should be_valid
	end

	it "is valid if the frequency is 'monthly'" do
		@food.frequency = 'monthly'
		@food.should be_valid
	end

	it "retrieves the calorie information from the api" do
		@food.calories.should == 9.12
	end

	it "retrieves the sugar information from the api" do
		@food.sugars_grams.should == 0.53
	end

	it "retrieves the fat information from the api" do
		@food.fat_grams.should == 0.1
	end

	it "retrieves the sodium information from the api" do
		@food.sodium_grams.should == 102.24
	end
end
