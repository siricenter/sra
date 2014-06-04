When(/^I press the delete "(.*)" household button$/) do |family_name|
	household = Household.find_by_name(family_name)
	click_on "#{household.id}_remove"
end
