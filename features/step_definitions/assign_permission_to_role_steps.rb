Given(/^the "(.*?)" permission has been created$/) do |permission|
	Permission.create(name: permission)
end

When(/^I assign the "(.*?)" permission to the "(.*?)" role$/) do |permission_name, role_name|
	permission = Permission.find_by_name(permission_name)
	role = Role.find_by_name(role_name)
		
	visit role_path(role)
	click_on "#{permission.id}_assign"
end

Then(/^the "(.*?)" permission should be assigned to the "(.*?)" role$/) do |permission_name, role_name|
	permission = Permission.find_by_name(permission_name)
	current_path.should == role_path(Role.find_by_name(role_name))
	page.has_selector?("#unassigned ##{permission.id}_assign").should == false
	page.has_selector?("#assigned ##{permission.id}_unassign").should == true
end

When(/^I unassign the "(.*?)" permission from the "(.*?)" role$/) do |permission_name, role_name|
	permission = Permission.find_by_name(permission_name)
	role = Role.find_by_name(role_name)

	visit role_path(role)
	click_on "#{permission.id}_unassign"
end

Given(/^I have assigned the "(.*?)" permission to the "(.*?)" role$/) do |permission_name, role_name|
	permission = Permission.find_by_name(permission_name)
	role = Role.find_by_name(role_name)

	role.permissions << permission
	role.save
end

Then(/^the "(.*?)" permission should be unassigned from the "(.*?)" role$/) do |permission_name, role_name|
	permission = Permission.find_by_name(permission_name)
	role = Role.find_by_name(role_name)

	current_path.should == role_path(role)
	page.has_selector?("#assigned ##{permission.id}_unassign").should == false
	page.has_selector?("#unassigned ##{permission.id}_assign").should == true
end
