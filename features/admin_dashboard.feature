Feature: Admin visit the admin dashboard 
	He is then able to assign roles and create users
	In a few clicks
    
    Scenario: Admin Creating a User on the admin Dashboard page
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I fill out the new user form with email "test@test.com" and password "password123"
        Then I should be on the "admin dashboard" page
        And there should be a user with email "test@test.com" 
        
    Scenario: Admin Getting to  user index in the matter of one click from the dashboard
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Users"
        Then I should be on the "Users Index" page
        
	Scenario: Admin goes to roles index in one click from the dashboard
		Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Roles"
        Then I should be on the "Roles Index" page

Scenario: Admin Getting to  user index in the matter of one click from the dashboard
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Areas"
        Then I should be on the "Areas Index" page
