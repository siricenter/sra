Given(/^I am an Admin$/) do
end

Given(/^a user has been created$/) do
	@user = User.new({email: "joe@email.com", password: "abc123456", password_confirmation: "abc123456"})
	@user.save!.should == true
	@user = User.find_by_email("joe@email.com")
end

Given(/^the "(.*?)" role has been created$/) do |name|
	@role = Role.new({name: name})
	@role.save
end

When(/^I assign the "(.*?)" to the user$/) do |role|
	visit user_path(@user)
	click_on "#{role}_assign"
end

Then(/^the "(.*?)" role should be assigned to the user$/) do |role|
	current_path.should == user_path(@user)
	page.has_selector?("#unassigned ##{@role.name}_assign").should == false
	page.has_selector?("#assigned ##{@role.name}_unassign").should == true
end

Given(/^I have assigned the "(.*?)" role to the user$/) do |role|
	@user.roles << Role.find_by_name(role)
	@user.save!
end

When(/^I unassign the "(.*?)" from the user$/) do |role|
	visit user_path(@user)
	click_on "#{role}_unassign"
end

Then(/^the "(.*?)" role should be unassigned$/) do |arg1|
	current_path.should == user_path(@user)
	page.has_selector?("#assigned ##{@role.name}_unassign").should == false
	page.has_selector?("#unassigned ##{@role.name}_assign").should == true
end
