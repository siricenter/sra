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

	

	describe "With consumed foods" do
		before :each do
			@interview = FactoryGirl.build(:interview)
			@interview.consumed_foods << FactoryGirl.build(:consumed_food)
		end

		it "calculates how many calories the household eats per day" do
			@interview.calories.should == 9.12 * 3
		end

		it "calculates how many grams of sugar the household eats per day" do
			@interview.sugars_grams.should == 0.53 * 3
		end

		it "calculates how many grams of fat the household eats per day" do
			@interview.fat_grams.should == 0.1 * 3
		end

		it "calculates how many grams of sodium the household eats per day" do
			@interview.sodium_grams.should == 102.24 * 3
		end

		it "calculates how many grams of protein the household eats per day" do
			@interview.protein_grams.should == 0.86 * 3
		end

		it "calculates how much cholesterol the household eats per day" do
			@interview.cholesterol_grams.should == 0 * 3
		end

		it "calculates what percent of vitamin A daily value the household eats per day" do
			@interview.vitamin_a_dv.should == 59 * 3
		end

		it "calculates what percent of vitamin C daily value the household eats per day" do
			@interview.vitamin_c_dv.should == 24 * 3
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

		it "returns 0 grams of protein" do
			@interview.protein_grams.should == 0
		end

		it "returns 0 grams of cholesterol" do
			@interview.cholesterol_grams.should == 0
		end

		it "returns 0% dv of vitamin a" do
			@interview.vitamin_a_dv.should == 0
		end

		it "returns 0% dv of vitamin c" do
			@interview.vitamin_c_dv.should == 0
		end
	end

end
