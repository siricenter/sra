Feature: Field Worker conducts food interview
	As a field worker
	I want to print off a garden reccommendation
	In order to help the families feed themselves

	Scenario: Enter food information
		When I am on the "/food_interviews/new" page 
		And I search for "chard"
		And I click ""
		Then the form should contain ""
