require 'spec_helper'

describe JobsController do
	person_attributes = {given_name: "Gabriela",
		family_name: "Martinez",
		birthday: Time.now,
		education_level: "some college",
		gender: "male",
		in_school: true
	}


	describe "GET 'new'" do
		it "returns http success" do
			person = Person.create(person_attributes)
			get 'new', person_id: person.id
			response.should be_success
		end
	end

	describe "GET 'index'" do
		it "returns http success" do
			person = Person.create(person_attributes)
			get 'index', person_id: person.id
			response.should be_success
		end
	end

	describe "GET 'show'" do
		it "returns http success" do
			person = Person.create
			occupation = Occupation.create name: "Programmer"
			job = Job.new

			job.person = person
			job.occupation = occupation
			job.save

			get 'show', id: job.id
			response.should be_success
		end
	end

	describe "GET 'edit'" do
		it "returns http success" do
			person = Person.create
			occupation = Occupation.create name: "Programmer"
			job = Job.new

			job.person = person
			job.occupation = occupation
			job.save

			get 'edit', id: job.id
			response.should be_success
		end
	end

end
