Feature: Admin assigns user to area
	As an Admin
    I want to assign a user to an area which also builds a relationship to that user
	In order to provide structure to the organization

	Scenario: Assign Field Worker from Area
		Given I am a "Admin"
		And a user with email "test@test.com" has been created
		And the "Field Worker" role has been created
		And the user "test@test.com" has been assigned the "Field Worker" role
		And the "Novo Darnitsya" area has been created
		When I visit the "Novo Darnitsya" area's page
		And I assign "test@test.com" to the area with a relationship of "ield_worker"
		Then I should be on the "Novo Darnitsya" area's show page
		And "test@test.com" should be assigned to "Novo Darnitsya" with a relationship of "field_worker"

	Scenario: Unassign Field Worker from Area
		Given I am a "Admin"
		And a user with email "test@test.com" has been created
		And the "Field Worker" role has been created
		And the user "test@test.com" has been assigned the "Field Worker" role
		And the "Novo Darnitsya" area has been created
		When I visit the "Novo Darnitsya" area's page
		And "test@test.com" is assigned to the area
		And I unassign "test@test.com" from the area
		Then I should be on the "Novo Darnitsya" area's show page
		And "test@test.com" should not be assigned to "Novo Darnitsya"
