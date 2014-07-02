require 'spec_helper'

describe Interview do
	before :each do
		DatabaseCleaner[:mongoid].start
		@interview = FactoryGirl.build(:interview)
	end

	after :each do
		DatabaseCleaner[:mongoid].clean
	end

	it "has a valid factory" do
		@interview.should be_valid
	end

	it "is invalid without a household_id" do
		@interview.household_id = nil
		@interview.should_not be_valid
	end

	it "is invalid without a roof" do
		@interview.roof = nil
		@interview.should_not be_valid
	end

	it "is invalid without a wall" do
		@interview.wall = nil
		@interview.should_not be_valid
	end

	it "is invalid without a floor" do
		@interview.floor = nil
		@interview.should_not be_valid
	end

	it "is invalid without a bedroom_count" do
		@interview.bedroom_count = nil
		@interview.should_not be_valid
	end

	it "is invalid without a light" do
		@interview.light = nil
		@interview.should_not be_valid
	end

	it "is invalid without a fuel_type" do
		@interview.fuel_type = nil
		@interview.should_not be_valid
	end

	it "is invalid without a total_income" do
		@interview.total_income = nil
		@interview.should_not be_valid
	end

	it "is invalid without a radio" do
		@interview.radio = nil
		@interview.should_not be_valid
	end

	it "is invalid without a tv" do
		@interview.tv = nil
		@interview.should_not be_valid
	end

	it "is invalid without a refrigerator" do
		@interview.refrigerator = nil
		@interview.should_not be_valid
	end

	describe "With consumed foods" do
		before :each do
			@interview = FactoryGirl.build(:interview)
			@interview.consumed_foods << FactoryGirl.build(:consumed_food)
		end

		it "calculates how many calories the household eats per day" do
			@interview.calories.should == 9.12
		end

		it "calculates how many grams of sugar the household eats per day" do
			@interview.sugars_grams.should == 0.53
		end

		it "calculates how many grams of fat the household eats per day" do
			@interview.fat_grams.should == 0.1
		end

		it "calculates how many grams of sodium the household eats per day" do
			@interview.sodium_grams.should == 102.24
		end
	end

	describe "with no consumed foods" do
		it "returns 0 calories" do
			@interview.calories.should == 0
		end

		it "returns 0 grams of sugar" do
			@interview.sugars_grams.should == 0
		end

		it "returns 0 grams of fat" do
			@interview.fat_grams.should == 0
		end

		it "returns 0 grams of sodium" do
			@interview.sodium_grams.should == 0
		end
	end

end
