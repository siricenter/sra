Feature: Field worker adds person to household
	In order to gather individual data
	As a field worker
	I want to add a person to a household

	Scenario: Start Form
		Given I am logged in
		And I have created a family
		And I am on the family's personal page
		When I press id "add_person_top" 
		Then I should be on the create person page

	Scenario: Create Person
		Given I am logged in
		And I have created a family
		And I am on the create person page
		When I set the given name to "Mariana"
		And I set the family name to "Rodriguez"
		And I set the birthday to "May" "22" "1987"
		And I set the education level to "Secondary"
		And I set the gender to "Female"
		And I set in school to "false"
		And I press "submit"
		Then I should be on the household's personal page
