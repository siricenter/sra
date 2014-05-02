# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Household do
	before :each do
		@household = FactoryGirl.build(:household)
	end

	it "should have a valid factory" do
		@household.should be_valid
	end

	it "should not be valid without a name" do
		@household.name = nil
		@household.should_not be_valid
	end
	
	it "should only contain letters" do
		@household.name = "abc123"
		@household.should_not be_valid
	end
end
