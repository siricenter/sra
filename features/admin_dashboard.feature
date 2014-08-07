Feature: Admin visit the admin dashboard 
	He is then able to assign roles and create users
	In a few clicks
    
    Scenario: Admin Getting to assign roles page in the matter of one click from the dashboard.
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Users Index"
		Then I should be on the "Users Index" page
        
    Scenario: Admin Getting to create user page in the matter of one click from the dashboard
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Create User"
        Then I should be on the "Create User" page
        