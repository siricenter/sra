Given(/^I am a field worker$/) do
	field_worker = User.new({email: "fw@fw.com", password: "abc123456", password_confirmation: "abc123456"})
	field_worker.roles << Role.find_by_name("Field Worker")
	field_worker.save!

	visit 'users/sign_in'
	fill_in "user_email", with: field_worker.email
	fill_in "user_password", with: field_worker.password
	click_button "Sign in"
end

When(/^I go to the "(.*?)" page$/) do |page|
	visit "#{page}"
end

When(/^I press "(.*?)"$/) do |name|
	click_on name
end

When(/^I press id "(.*?)"$/) do |name|
	click_on name.to_sym
end

When(/^I fill out the household form$/) do 
	fill_in 'household_name', with: "Gonzales"
	click_on "Submit"
end

Then(/^I should be on the "(.*?)" page$/) do |page|
	current_path.should == "#{page}"
end

Then(/^I should be on the last household page$/) do
	current_path.should == household_path(Household.last)
end
