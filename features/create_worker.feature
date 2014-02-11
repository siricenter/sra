Feature: Create Worker
	In order to register a new worker
	So the business may expand
	An Administrator
	Should create a new worker using the create_worker form

	Scenario: Creates a new worker
		Given I am on the worker's "index" page
		When I enter "New Worker"
		And I fill in "Worker Given Name" with "Maria"
		And I fill in "Worker Family Name" with "Gonzalez"
		And I fill in "Worker Birthday" with "August 10, 1978"
		And I press "Submit"
		Then the page should show "worker show page" and have message "Worker Created"
