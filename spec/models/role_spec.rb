require 'spec_helper'

describe Role do
	before :each do
		@role = Role.new
	end
	it "should know when it contains a given permission" do
		permissions = Permission.create([
			{name: "Create Household"},
			{name: "Edit Household"}
		])

		permissions.each do |permission|
			@role.permissions << permission
		end

		@role.has_permission("Edit Household").should == true
	end

	it "should know when it doesn't contain a given permission" do
		permissions = Permission.create([
			{name: "Create Household"},
			{name: "Edit Household"}
		])

		permissions.each do |permission|
			@role.permissions << permission
		end

		@role.has_permission("Delete Household").should == false
	end
end
