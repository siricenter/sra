
When(/^I assign the "(.*?)" to the user "(.*?)"$/) do |role_name, email|
	role = Role.find_by_name(role_name)
	user = User.find_by_email(email)
	visit user_path(user)
	click_on "#{role.id}_assign"
end

When(/^I unassign the "(.*?)" from the user "(.*?)"$/) do |role_name, email|
	role = Role.find_by_name(role_name)
	user = User.find_by_email(email)
	visit user_path(user)
	click_on "#{role.id}_unassign"
end

Then(/^the user "(.*?)" should not be assigned the "(.*?)" role$/) do |email, role_name|
	user = User.find_by_email(email)
	role = Role.find_by_name(role_name)

	current_path.should == user_path(user)
	page.has_selector?("#assigned ##{role.id}_unassign").should_not == true
	page.has_selector?("#unassigned ##{role.id}_assign").should == true
end
