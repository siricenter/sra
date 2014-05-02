require 'spec_helper'

describe Morbidity do
	before :each do
		@morbidity = FactoryGirl.build(:morbidity)
	end

	it "should have a valid factory" do
		@morbidity.should be_valid
	end

	it "shouldn't be valid without a child_sickness_frequency" do
		@morbidity.child_sickness_frequency = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without a child_sickness_time" do
		@morbidity.child_sickness_time = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without a child_aid" do
		@morbidity.child_aid = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without a child_common_ailment" do
		@morbidity.child_common_ailment = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without an adult_sickness_frequency" do
		@morbidity.adult_sickness_frequency = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without an adult_sickness_time" do
		@morbidity.adult_sickness_time = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without an adult_aid" do
		@morbidity.adult_aid = nil
		@morbidity.should_not be_valid
	end

	it "shouldn't be valid without an adult_common_ailment" do
		@morbidity.adult_common_ailment = nil
		@morbidity.should_not be_valid
	end
end
