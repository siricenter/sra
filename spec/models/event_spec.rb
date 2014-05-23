# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  start      :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'factory_girl'

describe Event do
	before :each do
		@event = FactoryGirl.build(:event)
	end

	it "has a valid factory" do
		@event.should be_valid
	end

	it "requires a title" do
		@event.title = nil
		@event.should_not be_valid
	end

	it "requires a start" do
		@event.start = nil
		@event.should_not be_valid
	end
end
