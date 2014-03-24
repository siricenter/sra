Given(/^the "(.*?)" permission has been created$/) do |permission|
	Permission.create({name: permission})
end

When(/^I assign the "(.*?)" permission to the "(.*?)" role$/) do |permission, role|
	@role = Role.find_by_name(role)
	visit role_path(@role)
	click_on "#{permission}_assign"
end

Then(/^the "(.*?)" permission should be assigned to the "(.*?)" role$/) do |arg1, arg2|
	  pending # express the regexp above with the code you wish you had
end
