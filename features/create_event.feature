Feature: Any user creates event
	As a registered user of any role
	I want to create a new calendar event
	In order to keep track of my important meetings

	Scenario: Create from dashboard
		Given I am a "Public"
		When I go to the "dashboard" page
		And I press "New Meeting"
		And I fill out the event form
		Then I should be on the "/dashboard" page
		And I should have a new meeting
