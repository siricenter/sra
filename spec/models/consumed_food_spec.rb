# == Schema Information
#
# Table name: consumed_foods
#
#  id           :integer          not null, primary key
#  interview_id :integer
#  n_id         :string(255)
#  servings     :integer
#  frequency    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_consumed_foods_on_interview_id  (interview_id)
#

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
		@food.calories.should == 9.12 * 3
	end

	it "retrieves the sugar information from the api" do
		@food.sugars_grams.should == 0.53 * 3
	end

	it "retrieves the fat information from the api" do
		@food.fat_grams.should == 0.1 * 3
	end

	it "retrieves the sodium information from the api" do
		@food.sodium_grams.should == 102.24 * 3
	end

	it "retrieves the protein information from the api" do
		@food.protein_grams.should == 0.86 * 3
	end

	 it "retrieves the total cholesterol from the api" do
		 @food.cholesterol_grams.should == 0 * 3
	 end
	
	it "retrieves the vitamin A DV from the api" do
		@food.vitamin_a_dv.should == 59 * 3
	end
	
	it "retrieves the vitamin C DV from the api" do
		@food.vitamin_c_dv.should == 24 * 3
	end

	it "retrieves the food's name from the api" do
		@food.name.should == "Swiss Chard, Raw - 1 leaf"
	end
end
