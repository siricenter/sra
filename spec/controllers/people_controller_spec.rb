require 'spec_helper'

describe PeopleController do
	let(:valid_session) {{}}
	let(:valid_attributes) {{
		birthday: Time.now,
		education_level: "some college",
		family_name: "Rodriguez",
		family_relationship: "father",
		gender: "male",
		given_name: "Jose",
		in_school: true
	}}
	describe 'GET index' do
		it "should redirect_to @household" do
			person = FactoryGirl.build :person
			household = FactoryGirl.create :household

			person.household = household
			person.save!

			get :index, {household_id: household.to_param}, valid_session
			response.should redirect_to(Household.last)
		end
	end

	describe 'GET show' do
		it "assigns the requested person to @person" do
			person = FactoryGirl.create :person
			get :show, {id: person.to_param}, valid_session
			assigns(:person).should eq(person)
		end
	end

	describe 'GET new' do
		it "assigns a new person as @person" do
			household = FactoryGirl.create :household
			get :new, {household_id: household.to_param}, valid_session
			assigns(:person).should be_a_new(Person)
		end

		it "assigns [@household, @person] as @path" do
			household = FactoryGirl.create :household
			get :new, {household_id: household.to_param}, valid_session
			assigns(:path).to_a[0].should eq(household)
			assigns(:path).to_a[1].should be_a_new(Person)
		end
	end

	describe 'GET edit' do
		it "assigns the requested person as @person" do
			person = FactoryGirl.create :person
			get :show, {id: person.to_param}, valid_session
			assigns(:person).should eq(person)
		end
	end

	describe 'POST create' do
		describe "with valid params" do
			it "creates a new Person" do
				household = FactoryGirl.create :household
				relationship = FactoryGirl.create :family_relationship

				expect {
					post :create,
					{household_id: household.to_param, 
						person: valid_attributes
				}, 
					valid_session
				}.to change(Person, :count).by(1)

			end

			it "assigns the new person as @person" do
				household = FactoryGirl.create :household
				relationship = FactoryGirl.create :family_relationship
				post :create,
					{household_id: household.to_param,
						person: valid_attributes},
						valid_session
				assigns(:person).should be_a(Person)
				assigns(:person).should be_persisted
			end

			it "redirects to the newly-created person's household" do
				household = FactoryGirl.create :household
				relationship = FactoryGirl.create :family_relationship
				post :create,
					{household_id: household.to_param,
						person: valid_attributes},
						valid_session
				response.should redirect_to(Household.last)
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved Person as @person" do
				household = FactoryGirl.create :household
				relationship = FactoryGirl.create :family_relationship
				post :create,
					{household_id: household.to_param,
						person: {}},
						valid_session
				assigns(:person).should be_a_new(Person)
			end

			it "re-renders the 'new' template" do
				household = FactoryGirl.create :household
				relationship = FactoryGirl.create :family_relationship
				post :create,
					{household_id: household.to_param,
						person: {}},
						valid_session
				response.should render_template("new")
			end
		end
	end

	describe 'PUT update' do
		describe "with valid params" do
			it "updates the requested person" do
				person = FactoryGirl.create :person
				put :update, {id: person.to_param, person: {"gender" => "other"}}, valid_session
				person = Person.find(person)
				person.gender.should == "other"
			end

			it "assigns the requested person as @person" do
				person = FactoryGirl.create :person
				put :update, {id: person.to_param, person: {"gender" => "other"}}, valid_session
				assigns(:person).should eq(person)
			end

			it "redirects to the requested person" do
				person = FactoryGirl.create :person
				put :update, {id: person.to_param, person: {"gender" => "other"}}, valid_session
				request.should redirect_to(person)
			end
		end

		describe "with invalid params" do
			it "assigns the person as @person" do
				person = FactoryGirl.create :person
				Person.any_instance.stub(:save).and_return(false)
				put :update, {id: person.to_param, person: {"gender" => "other"}}, valid_session
				assigns(:person).should eq(person)
			end

			it "re-renders the 'edit' template" do
				person = FactoryGirl.create :person
				Person.any_instance.stub(:save).and_return(false)
				put :update, {id: person.to_param, person: {}}, valid_session
				response.should render_template("edit")
			end
		end
	end

	describe 'DELETE destroy' do
		it "destroys the requested person" do
			person = FactoryGirl.create :person
			household = FactoryGirl.create :household

			person.household = household
			person.save

			expect {
				delete :destroy, {id: person.to_param}, valid_session
			}.to change(Person, :count).by(-1)
		end

		it "redirects to the person's household" do
			person = FactoryGirl.create :person
			household = FactoryGirl.create :household

			person.household = household
			person.save

			delete :destroy, {id: person.to_param}, valid_session
			response.should redirect_to(household)
		end
	end
end
