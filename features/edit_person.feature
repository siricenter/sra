Feature: Field worker edits person
	In order to keep information up to date
	As a field worker
	I want to edit a person

	Scenario: Start From Personal Page
		Given I am logged in
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on "Gabriela" "Martinez"'s personal page
		When I press id "edit_person_top"
		Then I should be on the edit person page for "Gabriela" "Martinez"

	Scenario: Start From Household Page
		Given I am logged in
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on the "Martinez" family's personal page
		When I press "Gabriela" "Martinez"'s edit button
		Then I should be on the edit person page for "Gabriela" "Martinez"

	Scenario: Edit Person
		Given I am logged in
		And I have created a family named "Martinez"
		And I have created a person named "Gabriela" "Martinez"
		And I am on the edit person "Gabriela" "Martinez" page
		When I fill out the edit person form to "Marina" "Martinez"
		Then I should be on "Marina" "Martinez"'s personal page
