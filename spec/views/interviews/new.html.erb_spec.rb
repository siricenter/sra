require 'spec_helper'

describe "interviews/new" do
	before(:each) do
		@household = assign(:household, stub_model(Household))
		@interview = assign(:interview, stub_model(Interview).as_new_record)
		assign(:path, [@household, @interview])
	end

	it "renders new interview form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form[action=?][method=?]", household_interviews_path(@household), "post" do
		end
	end
end
