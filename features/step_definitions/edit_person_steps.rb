Given(/^I am on "(.*?)" "(.*?)"'s personal page$/) do |given_name, family_name|
	person = Person.find_by_given_name given_name
	visit person_path(person)
	current_path.should == person_path(person)
end

Then(/^I should be on the edit person page for "(.*?)" "(.*?)"$/) do |given_name, family_name|
	person = Person.find_by_given_name given_name
	current_path.should == edit_person_path(person)
end

When(/^I press "(.*?)" "(.*?)"'s edit button$/) do |given_name, family_name|
	person = Person.find_by_given_name given_name
	current_path.should == household_path(person.household)
	click_on "#{person.id}_edit"
end

Given(/^I am on the edit person "(.*?)" "(.*?)" page$/) do |given_name, family_name|
	person = Person.find_by_given_name given_name
	visit edit_person_path(person)
end

Then(/^I should be on "(.*?)" "(.*?)"'s personal page$/) do |given_name, family_name|
	person = Person.find_by_given_name given_name
	current_path.should == person_path(person)
end

When(/^I fill out the edit person form to "(.*)" "(.*)"$/) do |given_name, family_name|
	fill_in "Given name", with: given_name
	fill_in "Family name", with: family_name
	click_on "Submit"
end
