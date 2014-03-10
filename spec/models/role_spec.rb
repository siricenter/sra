require 'spec_helper'

describe Role do
	before :each do 
		@role = Role.new
	end

	it "should set a new name"  do
		@role.name = "public"
		@role.name.should == "public"
	end

	it "should not save without a name" do
		@role.save.should == false
	end

	it "should have users" do
		@role.users.should == []
	end

	it "should save with user association" do 
		@user = User.new(email: "potato02@email.com", password: "potatoesrgr3at", password_confirmation: "potatoesrgr3at")
		@user.roles << @role 
		@role.name = "public"
		@user.save.should == true
		
		# The role should also be saved
		Role.where(name: "public").nil?.should == false
	end
end
