Then(/^I should be on the create person page$/) do
	current_path.should == new_household_person_path(@household)
end

Given(/^I am on the create person page$/) do
	visit new_household_person_path(@household)
end

When(/^I fill out the person form$/) do
	fill_in "person_given_name", with: "joe"

	fill_in "person_family_name", with: "johnson"

	select "1999", from: "person_birthday_1i"
	select "November", from: "person_birthday_2i"
	select "11", from: "person_birthday_3i"

	select "Secondary", from: "person_education_level"

	select "Other", from: "person_gender"

	check "person_in_school"
	click_on "Submit"
end

Then(/^I should be on the household's personal page$/) do
	current_path.should == household_path(@household)
end
