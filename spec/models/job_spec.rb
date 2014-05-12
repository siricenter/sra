# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  seasonal      :boolean
#  description   :string(255)
#  person_id     :integer
#  occupation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Job do
	before :each do
		@job = FactoryGirl.build(:job)
	end

	it "should have a valid factory" do
		@job.should be_valid
	end

	it "should be invalid without a person" do
		@job.person = nil
		@job.should_not be_valid
	end

	it "should be invalid without a occupation" do
		@job.occupation = nil
		@job.should_not be_valid
	end
end
