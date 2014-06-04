Then(/^I should be on the create person page for the "(.*)" family$/) do |family_name|
	household = Household.find_by_name(family_name)
	current_path.should == new_household_person_path(household)
end

Given(/^I am on the "(.*)" family create person page$/) do |family_name|
	household = Household.find_by_name family_name
	visit new_household_person_path(household)
end

Given(/^I have created a person named "(.*?)" "(.*?)"$/) do |given_name, family_name|
	household = Household.find_by_name family_name
	@person = Person.create(
		given_name: given_name,
		family_name: family_name,
		birthday: Date.today,
		education_level: "Some College",
		gender: "Other",
		in_school: true
	)
	@person.household = household
	relationship = FamilyRelationship.find_by_name("Mother")
	@person.family_relationship = relationship
	@person.save
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
