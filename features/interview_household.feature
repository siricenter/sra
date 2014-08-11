Feature: Field worker interviews household
	In order to meet a household's needs
	As a field worker
	I want to interview a household

	@javascript
	Scenario: Interview household
		Given I am a "Field Worker"
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on the "Martinez" family's personal page
		When I press id "interview_household"
		And I fill out the interview form
		Then I should be on the "interview's show" page
	
	@javascript
	Scenario: Edit interview
		Given I am a "Field Worker"
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on the "Martinez" family's personal page
		When I press id "interview_household"
		And I fill out the interview form
		And I press "Edit Interview"
		And I edit the interview form
		Then I should be on the "interview's show" page
		And the interview should reflect the changes I made
