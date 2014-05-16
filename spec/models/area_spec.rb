# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'factory_girl'

describe Area do
	before :each do
		@area = FactoryGirl.build(:area)
	end

	it "has a valid factory" do
		@area.should be_valid
	end

	it "requires a name" do
		@area.name = nil
		@area.should_not be_valid
	end
end
