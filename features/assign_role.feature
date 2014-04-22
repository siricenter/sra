Feature: Admin assigns role to user 
	In order to keep data secure and alow for more workers
	As an Admin
	I want to assign a role to a user 

	Scenario: Assign role 
		Given I am an Admin
		And a user has been created 
		And the "Manager" role has been created 
		When I assign the "Manager" to the user 
		Then the "Manager" role should be assigned to the user 

	Scenario: Unassign role
		Given I am an Admin
		And a user has been created
		And the "Manager" role has been created
		And I have assigned the "Manager" role to the user
		When I unassign the "Manager" from the user
		Then the "Manager" role should be unassigned
