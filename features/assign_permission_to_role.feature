Feature: Admin assigns permission to role
	In order to manage changing business requirements
	As an Admin
	I want to assign permissions to a role

	Scenario: Assign Permission
		Given I am an Admin
		And the "Field Worker" role has been created
		And the "Create Household" permission has been created
		When I assign the "Create Household" permission to the "Field Worker" role
		Then the "Create Household" permission should be assigned to the "Field Worker" role

	Scenario: Unassign Permission
		Given I am an Admin
		And the "Field Worker" role has been created
		And the "Create Household" permission has been created
		And I have assigned the "Create Household" permission to the "Field Worker" role
		When I unassign the "Create Household" permission from the "Field Worker" role
		Then the "Create Household" permission should be unassigned from the "Field Worker" role
