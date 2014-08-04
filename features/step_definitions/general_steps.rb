Given(/^I am a "(.*?)"$/) do |role|
	@current_user = User.new({email: "user@user.com", password: "abc123456", password_confirmation: "abc123456"})
	@current_user.roles << Role.find_by_name(role)
	@current_user.save!

	visit new_user_session

	fill_in "user[email]", with: @current_user.email
	fill_in "user_password", with: @current_user.password

	click_button "Sign in"
end

Given(/^a user with email "(.*?)" has been created$/) do |email|
	User.create({email: email, password: "abc123456", password_confirmation: "abc123456"})
end

Given(/^the "(.*?)" role has been created$/) do |name|
	@role = Role.new({name: name})
	@role.save
end

When(/^I go to the "(.*?)" page$/) do |page|
	visit "#{page}"
end

When(/^I press id "(.*?)"$/) do |name|
	click_on name.to_sym
end

When(/^I press "(.*?)"$/) do |name|
	click_on name.to_sym
end

Then(/^I should be on the "(.*?)" page$/) do |page|
	if page == "interview's show"
		current_path.should == interview_path(Interview.last)
	else
		current_path.should == "#{page}"
	end
end
