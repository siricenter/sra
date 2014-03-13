Given(/^I am logged in$/) do
end

When(/^I go to the "(.*?)" page$/) do |page|
	visit "#{page}"
end

When(/^I press "(.*?)"$/) do |name|
	click_on name
end

When(/^I press id "(.*?)"$/) do |name|
	click_on name.to_sym
end

When(/^I enter the name "(.*?)"$/) do |name|
	fill_in 'household_name', with: name
end

Then(/^I should be on the "(.*?)" page$/) do |page|
	current_path.should == "#{page}"
end
