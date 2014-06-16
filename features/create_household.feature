# // @annotation:tour cucumber-header
Feature: Field worker creates household

	As a field worker
	I want to create a household
	In order to start working with a household
# // @annotation:/tour cucumber-header

# // @annotation:tour cucumber-scenario-1
	Scenario: Start Form
# // @annotation:/tour cucumber-scenario-1
# // @annotation:tour cucumber-scenario-2
		Given I am a "Field Worker"
		When I go to the "households" page
		And I press id "top"
		Then I should be on the "/households/new" page
# // @annotation:/tour cucumber-scenario-2

	Scenario: Fill out form
		Given I am a "Field Worker"
		When I go to the "households/new" page
		And I fill out the household form
		Then I should be on the last household page
