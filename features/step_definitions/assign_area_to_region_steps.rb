Given(/^the "(.*?)" region has been created$/) do |region_name|
	Region.create!(name: region_name)
end

When(/^I visit the "(.*?)" region's page$/) do |region_name|
	region = Region.find_by_name(region_name)
	visit region_path(region)
end

When(/^I assign "(.*?)" to the region$/) do |area_name|
	area = Area.find_by_name(area_name)
	click_on "#{area.id}_assign"
end

When(/^I unassign "(.*?)" from the region$/) do |area_name|
	area = Area.find_by_name(area_name)
	click_on "#{area.id}_unassign"
end

Then(/^I should be on the "(.*?)" region's page$/) do |region_name|
	region = Region.find_by_name(region_name)
	current_path.should == region_path(region)
end

Then(/^the "(.*?)" area should be assigned to the "(.*?)" region$/) do |area_name, region_name|
	area = Area.find_by_name(area_name)
	region = Region.find_by_name(region_name)

	area.regions.include?(region).should == true
	region.areas.include?(area).should == true
end

Then(/^the "(.*?)" area should not be assigned to the "(.*?)" region$/) do |area_name, region_name|
	area = Area.find_by_name(area_name)
	region = Region.find_by_name(region_name)

	area.regions.include?(region).should_not == true
	region.areas.include?(area).should_not == true
end
