# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'spec_helper'

describe User do
	before :each do
		@user = FactoryGirl.build :user
	end

	it "has a valid factory" do
		@user.should be_valid
	end

	it "should know when a user has a given role" do
		@user.roles << Role.create(name: "Field Worker")
		@user.has_role?("Field Worker").should == true
	end

	it "should know when a user doesn't have a given role" do
		@user.has_role?("Executive").should == false
	end

end
