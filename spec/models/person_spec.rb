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
		@person = FactoryGirl.build :person
	end
	
	it "has a valid factory" do
		@person.should be_valid
	end
	
	it "is valid when the person is not in school" do
		@person.in_school = "0"
		@person.should be_valid
	end
end
