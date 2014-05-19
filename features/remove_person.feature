Feature: Field worker removes person from household
	In order to accurately update family composition
	As a field worker
	I want to remove a person from a household

	Scenario: Remove a person
		Given I am a "Field Worker"
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on the "Martinez" family's personal page
		And I press the delete person button
		Then I should be on the last household page
