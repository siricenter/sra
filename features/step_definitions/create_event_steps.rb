When(/^I fill out the event form$/) do
	fill_in :event_title, with: 'Some Event'
	click_on 'Create Event'
end

Then(/^I should have a new meeting$/) do
	user = User.find_by_email("user@user.com")
	user.events.first.title.should == 'Some Event'
end
