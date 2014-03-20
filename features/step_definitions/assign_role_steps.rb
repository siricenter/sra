Given(/^I am an  Admin$/) do
end

Given(/^a user has been created$/) do
	@user = User.new({email: "joe@gmail.com", password: "abc123", password_confirmation: "abc123"})
	@user.save
end

Given(/^the "(.*?)" role has been created$/) do |name|
	@role = Role.new({name: name})
	@role.save
end

When(/^I assign the "(.*?)" to the user$/) do |name|
	visit user_path(@user)
	click_on "#{@role.id}_assign"
end

Then(/^the "(.*?)" role should be assigned to the user$/) do |role|
    current_path.should == user_path(@user)
	page.has_selector?("#assigned ##{@role.id}_unassign").should == true
	page.has_selector?("#assigned ##{@role.id}_assign").should == false
end
