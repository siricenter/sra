Feature: Field worker removes household
	In order to mark a family as having completed training
	As a field worker
	I want to remove a household

	Scenario: Remove a family
		Given I am logged in 
		And I have created a family
		When I go to the "households" page
		And I press the delete household button
		Then I should be on the "/households" page
