Feature: Admin assigns area to region
	In order to provide managerial structure to the organization
	As an Admin
	I want to assign an area to a region

	Scenario: Assign Area from Region
		Given I am a "Admin"
		And the "Kyiv" region has been created
		And the "Novo Darnitsya" area has been created
		When I visit the "Kyiv" region's page
		And I assign "Novo Darnitsya" to the region
		Then I should be on the "Kyiv" region's page
		And the "Novo Darnitsya" area should be assigned to the "Kyiv" region

	Scenario: Assign Area from Region
		Given I am a "Admin"
		And the "Kyiv" region has been created
		And the "Novo Darnitsya" area has been created
		When I visit the "Kyiv" region's page
		And I assign "Novo Darnitsya" to the region
		And I unassign "Novo Darnitsya" from the region
		Then I should be on the "Kyiv" region's page
		And the "Novo Darnitsya" area should not be assigned to the "Kyiv" region
