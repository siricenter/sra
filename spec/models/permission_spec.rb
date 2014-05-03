# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Permission do
	before :each do 
		@permission = FactoryGirl.build(:permission)
	end

	it "should have a valid factory" do
		@permission.should be_valid
	end

	it "Shouldn't be valid without a name" do
		@permission.name = nil
		@permission.should_not be_valid
	end

	it "shouldn't be valid with a duplicate name" do
		first = FactoryGirl.create :permission
		second = FactoryGirl.build :permission

		first.should be_valid
		second.should_not be_valid
	end
end
