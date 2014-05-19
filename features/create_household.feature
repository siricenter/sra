Feature: Field worker creates household
	In order to start working with a household
	As a field worker
	I want to create a household

	Scenario: Start Form
		Given I am a "Field Worker"
		When I go to the "households" page
		And I press id "top"
		Then I should be on the "/households/new" page

	Scenario: Fill out form
		Given I am a "Field Worker"
		When I go to the "households/new" page
		And I fill out the household form
		Then I should be on the last household page
