Feature: Admin assigns user role
	In order to assign responsibilities
	As an Admin
	I want to assign a role to a user

	Scenario: Assign role
		Given a user has no roles
		When I go to the "show user" page
		And I press "add role"
		And I select "field worker"
		And I press "Submit"
		Then I should see that a user has the "field worker" role
