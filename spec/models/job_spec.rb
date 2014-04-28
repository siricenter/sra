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
