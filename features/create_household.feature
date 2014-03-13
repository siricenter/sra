Feature: Field worker creates household
	In order to start working with a household
	As a field worker
	I want to create a household

	Scenario: Start Form
		Given I am logged in
		When I go to the "households" page
		And I press id "top"
		Then I should be on the "/households/new" page

	Scenario: Fill out form
		Given I am logged in
		When I go to the "households/new" page
		And I enter the name "Gonzalez"
		And I press "Submit"
		Then I should be on the "/households/1" page
