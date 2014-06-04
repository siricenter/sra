Given(/^I have created a family named "(.*)"$/) do |family_name|
	household = FactoryGirl.create(:household, name: family_name, user: @current_user)
	household.save
end

Given(/^I am on the "(.*)" family's personal page$/) do |family_name|
	household = Household.find_by_name family_name
	visit household_path(household)
	current_path.should == household_path(household)
end

Then(/^I should be on the "(.*)" family's edit page$/) do |family_name|
	household = Household.find_by_name(family_name)
	current_path.should == edit_household_path(household)
end

Given(/^I am on the family index page$/) do
	visit "households"
end

When(/^I press Edit on the "(.*)" family's entry$/) do |family_name|
	household = Household.find_by_name(family_name)
	click_on "#{household.id}_edit"
end

Given(/^I am on the "(.*)" family's edit page$/) do |family_name|
	household = Household.find_by_name(family_name)
	visit edit_household_path(household)
end

Then(/^I should be on the "(.*)" family's personal page$/) do |family_name|
	household = Household.find_by_name(family_name)
	current_path.should == household_path(household)
end

When(/^I fill out the household edit form$/) do
	fill_in 'household_name', with: "Rodriguez"
	click_on "Submit"
end
