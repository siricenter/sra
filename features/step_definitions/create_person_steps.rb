Then(/^I should be on the create person page$/) do
	current_path.should == new_household_person_path(@household)
end

Given(/^I am on the create person page$/) do
	visit new_household_person_path(@household)
end

When(/^I set the given name to "(.*?)"$/) do |name|
	fill_in "person_given_name", with: name
end

When(/^I set the family name to "(.*?)"$/) do |name|
	fill_in "person_family_name", with: name
end

When(/^I set the birthday to "(.*?)" "(.*?)" "(.*?)"$/) do |month, day, year|
	select year, from: "person_birthday_1i"
	select month, from: "person_birthday_2i"
	select day, from: "person_birthday_3i"
end

When(/^I set the education level to "(.*?)"$/) do |level|
	select level, from: "person_education_level"
end

When(/^I set the gender to "(.*?)"$/) do |gender|
	select gender, from: "person_gender"
end

When(/^I set in school to "(.*?)"$/) do |in_school|
	if in_school == "true"
		check "person_in_school"
	else
		uncheck "person_in_school"
	end
end

Then(/^I should be on the household's personal page$/) do
	current_path.should == household_path(@household)
end
