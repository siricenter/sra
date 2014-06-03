Feature: Field Worker conducts food interview
	As a field worker
	I want to print off a garden reccommendation
	In order to help the families feed themselves

	Scenario: Enter food information
		When I go to the "/food_interviews/new" page 
		And I search for "chard"
		And I press "513fcc648110a4cafb90ca5e"
		Then the form should contain "513fcc648110a4cafb90ca5e"
