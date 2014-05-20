Given(/^I am a "(.*?)"$/) do |role|
	user = User.new({email: "user@user.com", password: "abc123456", password_confirmation: "abc123456"})
	user.roles << Role.find_by_name(role)
	user.save!

	visit '/users/sign_in'

	fill_in "user[email]", with: user.email
	fill_in "user_password", with: user.password

	click_button "Sign in"
end

Given(/^a user with email "(.*?)" has been created$/) do |email|
	user = User.create({email: email, password: "abc123456", password_confirmation: "abc123456"})
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

Then(/^I should be on the "(.*?)" page$/) do |page|
	current_path.should == "#{page}"
end
