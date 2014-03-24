require 'spec_helper'

describe User do
	before :each do
		@user = User.new
	end

	it "should know when a user has a given role" do
		@user.roles << Role.create(name: "Field Worker")
		@user.has_role("Field Worker").should == true
	end

	it "should know when a user doesn't have a given role" do
		@user.has_role("Executive").should == false
	end

	it "should know a user has a given permission" do
		role = Role.create(name: "Field Worker")
		role.permissions << Permission.create(name: "Create Household")

		@user.roles << role
		
		@user.has_permission("Create Household").should == true
	end

	it "should know a user doesn't have a given permission" do
		@user.has_permission("Create Household").should == false
	end


end
