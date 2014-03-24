Feature: Admin assigns permission to role
	In order to accomodate changing business needs
	As an Admin
	I want to assign a permission to a role

	Scenario: Assign Permission
		Given I am an Admin
		And the "field_worker" role has been created
		And the "create_household" permission has been created
		When I assign the "create_household" permission to the "field_worker" role
		Then the "create_household" permission should be assigned to the "field_worker" role
