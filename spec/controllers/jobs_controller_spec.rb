require 'spec_helper'

describe JobsController do

	describe "GET 'new'" do
		it "returns http success" do
			person = Person.create(given_name: "Gabriela", family_name: "Martinez")
			get 'new', person_id: person.id
			response.should be_success
		end
	end

	describe "GET 'index'" do
		it "returns http success" do
			person = Person.create(given_name: "Gabriela", family_name: "Martinez")
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
