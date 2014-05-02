# == Schema Information
#
# Table name: people
#
#  id                     :integer          not null, primary key
#  given_name             :string(255)
#  family_name            :string(255)
#  family_relationship_id :integer
#  birthday               :date
#  education_level        :string(255)
#  gender                 :string(255)
#  in_school              :boolean
#  is_alive               :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  household_id           :integer
#

require 'spec_helper'

describe Person do
	before :each do
		@person = FactoryGirl.build(:person)
	end

	it "should have a valid factory" do
		@person.should be_valid
	end

	it "shouldn't be valid without a given_name" do
		@person.given_name = nil
		@person.should_not be_valid
	end

	it "shouldn't be valid without a family_name" do
		@person.family_name = nil
		@person.should_not be_valid
	end

	it "shouldn't be valid without a birthday" do
		@person.birthday = nil
		@person.should_not be_valid
	end

	it "shouldn't be valid without an education_level" do
		@person.education_level = nil
		@person.should_not be_valid
	end

	it "shouldn't be valid without a gender" do
		@person.gender = nil
		@person.should_not be_valid
	end

	it "shouldn't be valid without an in_school" do
		@person.in_school = nil
		@person.should_not be_valid
	end

end
