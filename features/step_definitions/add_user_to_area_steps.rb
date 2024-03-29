Given(/^the user "(.*?)" has been assigned the "(.*?)" role$/) do |email, role|
	user = User.find_by_email(email)
	role = Role.find_by_name(role)

	user.roles << role
	user.save!
end

Given(/^the "(.*?)" area has been created$/) do |area|
	Area.create!(name: area)
end

When(/^I visit the "(.*?)" area's page$/) do |area_name|
	area = Area.find_by_name(area_name)
	visit area_path(area)
end
	

When(/^I assign "(.*?)" to the area with a relationship of "(.*?)"$/) do |email, relationship|
    case relationship
    when "Field Worker"
        relationship_string = "field_worker"
    when "Manager"
        relationship_string = "manager"
    end
	user = User.find_by_email(email)
        click_on "#{user.id}_assign_#{relationship_string}"
end

When(/^"(.*?)" is assigned to the area with a relationship of "(.*?)"$/) do |email, relationship|
    case relationship
    when "Field Worker"
        relationship_string = "field_worker"
    when "Manager"
        relationship_string = "manager"
    end
	user = User.find_by_email(email)
	click_on "#{user.id}_assign_#{relationship_string}"
end

When(/^I unassign "(.*?)" from the area$/) do |email|
	user = User.find_by_email(email)
	click_on "#{user.id}_unassign"
end

Then(/^I should be on the "(.*?)" area's show page$/) do |area_name|
	area = Area.find_by_name(area_name)
	current_path.should == area_path(area)
end

Then(/^"(.*?)" should be assigned to "(.*?)" with a relationship of "(.*?)"$/) do |email, area_name, relationship|
	user = User.find_by_email(email)
	area = Area.find_by_name(area_name)
    relation = AreaRelationship.where(user_id: user.id, area_id: area.id, relationship: relationship).first

    user.areas.include?(area).should == true
	area.users.include?(user).should == true
    user.area_relationships.include?(relation).should == true
    area.area_relationships.include?(relation).should == true
end

Then(/^"(.*?)" should not be assigned to "(.*?)" with a relationship of "(.*?)"$/) do |email, area_name, relationship|
	user = User.find_by_email(email)
	area = Area.find_by_name(area_name)
    relation = AreaRelationship.where(user_id: user.id, area_id: area.id, relationship: relationship).first

	user.areas.include?(area).should == false
	area.users.include?(user).should == false
    user.area_relationships.include?(relation).should == false
    area.area_relationships.include?(relation).should == false
end
