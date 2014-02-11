Given(/^I am logged in as "(.*?)"$/) do |user|
	pending
end

Given(/^I am on the worker's "(.*?)" page$/) do |page_name|
	visit workers_path if page_name == "index"
end

When(/^I enter "(.*?)"$/) do |arg1|
	  pending # express the regexp above with the code you wish you had
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	  pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)"$/) do |arg1|
	  pending # express the regexp above with the code you wish you had
end

Then(/^the page should show "(.*?)" and have message "(.*?)"$/) do |arg1, arg2|
	  pending # express the regexp above with the code you wish you had
end
