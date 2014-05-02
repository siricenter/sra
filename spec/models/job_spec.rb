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
		@person = Person.new
		@occupation = Occupation.new name: "Programmer"
		@job = Job.new
	end

	it "should be invalid without a person" do
		@job.occupation = @occupation
		
		@job.should_not be_valid
	end

	it "should be invalid without a occupation" do
		@job.person = @person
		@job.should_not be_valid
	end
end
