Feature: Admin assigns role to user 
	In order to keep data secure and alow for more workers
	As an Admin
	I want to assign a role to a user 

	Scenario: Assign role 
		Given I am a "Admin"
		And a user with email "test@test.com" has been created
		And the "Fake Role" role has been created 
		When I assign the "Fake Role" to the user "test@test.com"
		And the user "test@test.com" has been assigned the "Fake Role" role

	Scenario: Unassign role
		Given I am a "Admin"
		And a user with email "test@test.com" has been created
		And the "Fake Role" role has been created
		And the user "test@test.com" has been assigned the "Fake Role" role
		When I unassign the "Fake Role" from the user "test@test.com"
		Then the user "test@test.com" should not be assigned the "Fake Role" role
