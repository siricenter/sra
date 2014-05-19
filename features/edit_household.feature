Feature: Field worker edits household
	In order to change a family's name
	As a field worker
	I want to edit a household

	Scenario: change family's name from personal page
		Given I am a field worker
		And I have created a family named "Martinez"
		And I am on the "Martinez" family's personal page
		When I press id "rename_top"
		Then I should be on the family's edit page
   
	
	Scenario: change family's name from index of families
		Given I am a field worker
		And I have created a family named "Martinez"
		And I am on the family index page
		When I press Edit on the family's entry
		Then I should be on the family's edit page

	Scenario: change the family's name 
		Given I am a field worker
		And I have created a family named "Martinez"
		And I am on the family's edit page 
		When I fill out the household edit form
		Then I should be on the Rodriguez personal page 

