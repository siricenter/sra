Feature: Admin assigns role to user 
	In order to keep data secure and alow for more workers
	As an Admin
	I want to assign a role to a user 

	Scenario: Assign role 
		Given I am an Admin
		And a user has been created 
		And the "Fake Role" role has been created 
		When I assign the "Fake Role" to the user 
		Then the "Fake Role" role should be assigned to the user 

	Scenario: Unassign role
		Given I am an Admin
		And a user has been created
		And the "Fake Role" role has been created
		And I have assigned the "Fake Role" role to the user
		When I unassign the "Fake Role" from the user
		Then the "Fake Role" role should be unassigned
