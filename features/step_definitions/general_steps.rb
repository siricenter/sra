Given(/^I am a "(.*?)"$/) do |role|
	@current_user = User.new({email: "user@user.com", password: "abc123456", password_confirmation: "abc123456"})
	@current_user.roles << Role.find_by_name(role)
	@current_user.save!

	visit new_user_session_path

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
    if page == "admin dashboard"
        visit dashboard_path
    else
    	visit "#{page}"
    end
end

When(/^I press id "(.*?)"$/) do |name|
	click_on name.to_sym
end

When(/^I press "(.*?)"$/) do |name|
	click_on name.to_sym
end

Then(/^I should be on the "(.*?)" page$/) do |page|
	pages = {
		"households index" => lambda {households_path},
		"interview's show" => lambda {'/interviews/1'},
		"Users Index" => lambda {users_path},
        "admin dashboard" => lambda {dashboard_path},
		"Roles Index" => lambda {roles_path},
        "Areas Index" => lambda {areas_path},
	}

	page = pages[page].call if pages.has_key?(page)

	current_path.should == page
end

When(/^I fill out the new user form with email "(.*?)" and password "(.*?)"$/) do |email, password|                                                       
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_on 'Create User'
end                                                                                                                                                  
                                                                                                                                                     
Then(/^there should be a user with email "(.*?)"$/) do |email|         
	expect(User.where(name: email)).to_not be_nil
end                                                                                                                                                  
          
     
