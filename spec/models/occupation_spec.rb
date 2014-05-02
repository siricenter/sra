# == Schema Information
#
# Table name: occupations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Occupation do
	before :each do
		@occupation = FactoryGirl.build(:occupation)
	end

	it "should have a valid factory" do
		@occupation.should be_valid
	end

	it "shouldn't be valid without a name" do
		@occupation.name = nil
		@occupation.should_not be_valid
	end
end
