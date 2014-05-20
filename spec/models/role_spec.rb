# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Role do
	before :each do
		@role = FactoryGirl.build(:role)
	end

	it "should have a valid factory" do
		@role.should be_valid
	end

	it "shouldn't be valid without a name" do
		@role.name = nil
		@role.should_not be_valid
	end

	it "shouldn't be valid if name is a duplicate" do
		@role.save
		second = FactoryGirl.build(:role)
		@role.should be_valid
		second.should_not be_valid
	end
end
