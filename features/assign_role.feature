Feature: Admin assigns role to user 
	In order to keep data secure and alow for more workers
	As an Admin
	I want to assign a role to a user 

	Scenario: Assign role 
		Given I am an Admin
		And a user has been created 
		And the "field_worker" role has been created 
		When I assign the "field_worker" to the user 
		Then the "field_worker" role should be assigned to the user 

	Scenario: Unassign role
		Given I am an Admin
		And a user has been created
		And the "field_worker" role has been created
		And I have assigned the "field_worker" role to the user
		When I unassign the "field_worker" from the user
		Then the "field_worker" role should be unassigned
