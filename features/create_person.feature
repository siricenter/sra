Feature: Field worker adds person to household
	In order to gather individual data
	As a field worker
	I want to add a person to a household

	Scenario: Start Form
		Given I am a "Field Worker"
		And I have created a family named "Martinez"
		And I am on the "Martinez" family's personal page
		When I press id "add_person_top" 
		Then I should be on the create person page

	Scenario: Create Person
		Given I am a "Field Worker"
		And I have created a family named "Martinez"
		And I am on the "Martinez" family create person page
		When I fill out the person form
		Then I should be on the last household page
