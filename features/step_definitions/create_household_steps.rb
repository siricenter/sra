When(/^I fill out the household form$/) do 
	fill_in 'household_name', with: "Gonzales"
	click_on "Submit"
end

Then(/^I should be on the last household page$/) do
	current_path.should == household_path(Household.last)
end
