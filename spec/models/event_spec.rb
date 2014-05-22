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
