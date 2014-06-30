require 'spec_helper'

describe "interviews/show" do
	before(:each) do
		@household = FactoryGirl.create(:household)
		@interview = FactoryGirl.create(:interview, {household_id: @household.id})
	end

	it "renders attributes in <p>" do
		render 
		# Run the generator again with the --webrat flag if you want to use webrat matchers
	end
end
