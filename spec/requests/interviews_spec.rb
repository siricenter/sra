require 'spec_helper'

describe "Interviews" do
	before :each do
		DatabaseCleaner.start
		@household = Household.create(name: "Brewer")
	end

	after :each do
		DatabaseCleaner.clean
	end

	describe "GET households/:id/interviews" do
		it "works! (now write some real specs)" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			get household_interviews_path(@household)
			response.status.should be(200)
		end
	end

end
