require 'spec_helper'

describe "Interviews" do
	household = Household.create(name: "Poll")
	describe "GET households/#{household.id}/interviews" do
		it "works! (now write some real specs)" do
			# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			get household_interviews_path(household)
			response.status.should be(200)
		end
	end
end
