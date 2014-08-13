Scenario: Admin Getting to  user index in the matter of one click from the dashboard
    	Given I am a "Admin"
        When I go to the "admin dashboard" page
        And I press "Areas Index"
        Then I should be on the "Areas Index" page