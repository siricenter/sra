Feature: Admin assigns role to user 
	In order to keep data secure and alow for more workers
	As an Admin
	I want to assign a role to a user 

	Scenario: Assign role 
		Given I am an  Admin
		And a user has been created 
		And the "field_worker" role has been created 
		When I assign the "field_worker" to the user 
		Then the "field_worker" role should be assigned to the user 
