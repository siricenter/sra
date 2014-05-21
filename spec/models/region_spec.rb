# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'factory_girl'

describe Region do
	before :each do
		@region = FactoryGirl.build(:region)
	end

	it "has a valid factory" do
		@region.should be_valid
	end

	it "requires a name" do
		@region.name = nil
		@region.should_not be_valid
	end

	it "requires a unique name" do
		@region.save!
		@region2 = FactoryGirl.build(:region)

		@region.should be_valid
		@region2.should_not be_valid
	end
end
