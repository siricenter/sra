require 'spec_helper'

describe JobsController do
	before :each do
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	let(:valid_attributes) {{

	}}

	let(:person_attributes) {{
		given_name: "Gabriela",
		family_name: "Martinez",
		birthday: Time.now,
		education_level: "some college",
		gender: "male",
		in_school: true
	}}

	let(:valid_session) {{}}
	let(:occupation_attributes) {{name: "Farmer"}}


	describe "GET new" do
		it "returns http success" do
			person = FactoryGirl.create :person
			get 'new', person_id: person.id
			response.should be_success
		end

		it "assigns a new job as @job" do
			person = Person.create(person_attributes)
			get :new, {person_id: person.to_param}, valid_session
			assigns(:job).should be_a_new(Job)
		end
	end

	describe "GET 'index'" do
		it "returns http success" do
			person = Person.create(person_attributes)
			get 'index', person_id: person.id
			response.should be_success
		end

		it "assigns all jobs as @jobs" do
			job = FactoryGirl.create :job
			get 'index', person_id: job.person.id
			assigns(:jobs).to_a.should eq([job])
		end
	end

	describe "GET 'show'" do
		it "returns http success" do
			job = FactoryGirl.create :job
			get 'show', id: job.id
			response.should be_success
		end

		it "assigns the requested job as @job" do
			job = FactoryGirl.create :job
			get 'show', id: job.id
			assigns(:job).should eq(job)
		end
	end

	describe "GET 'edit'" do
		it "returns http success" do
			job = FactoryGirl.create :job
			get 'edit', id: job.id
			response.should be_success
		end

		it "assigns the requested job as @job" do
			job = FactoryGirl.create :job
			get 'show', id: job.id
			assigns(:job).should eq(job)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new job" do
				person = FactoryGirl.create :person
				occupation = FactoryGirl.create :occupation
				expect {
					post :create,
					{person_id: person.id, job: {occupation: "Farmer"}},
					valid_session
				}.to change(Job, :count).by(1)
			end

			it "assigns a newly created job as @job" do
				person = FactoryGirl.create :person
				occupation = FactoryGirl.create :occupation
				post :create,
					{person_id: person.id, job: {occupation: "Farmer"}},
					valid_session
				assigns(:job).should be_a(Job)
				assigns(:job).should be_persisted
			end

			it "redirects to the person for whom the job was created" do
				person = FactoryGirl.create :person
				occupation = FactoryGirl.create :occupation
				post :create,
					{person_id: person.id, job: {occupation: "Farmer"}},
					valid_session
				response.should redirect_to(Person.last)
			end
		end
	end

end
