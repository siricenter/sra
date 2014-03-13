Given(/^I have created a family$/) do
	@household = Household.create(name: "Gonzalez")
	@household.save
end

Given(/^I am on the family's personal page$/) do
	visit household_path(@household)
end

Then(/^I should be on the family's edit page$/) do
	current_path.should == edit_household_path(@household)
end

Given(/^I am on the family index page$/) do
	visit "households"
end

When(/^I press Edit on the family's entry$/) do
	click_on "#{@household.id}_edit"
end

Given(/^I am on the family's edit page$/) do
	visit edit_household_path(@household)
end

When(/^I press submit$/) do
	pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the Rodriguez personal page$/) do
	current_path.should == household_path(@household)
end
