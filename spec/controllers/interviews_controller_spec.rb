require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe InterviewsController do

	# This should return the minimal set of attributes required to create a valid
	# Interview. As you add validations to Interview, be sure to
	# adjust the attributes here as well.
	let(:valid_attributes) { {  } }
	let(:expense_attributes) {{
		shoe_cost: 10, 
		clothing_cost: 10, 
		medical_cost: 10,
		school_cost: 10,
		college_cost: 10,
		utilities_cost: 10,
		misc_cost: 10,

		shoe_unit: "day",
		clothing_unit: "day",
		medical_unit: "day",
		school_unit: "day",
		college_unit: "day",
		utilities_unit: "day",
		misc_unit: "day"
	}}
	let(:health_attributes) {{
		bathroom_type: "outhouse",
		garbage_disposal: "bury",
		separate_kitchen: true,
		sewage_disposal: "outhouse",
		water_source: "piped",
		water_chlorinated: true
	}}
	let(:morbidity_attributes) {{
		child_sickness_frequency: 1,
		child_sickness_time: "day",
		child_aid: "doctor",
		child_common_ailment: "influenza",

		adult_sickness_frequency: 1,
		adult_sickness_time: "day",
		adult_aid: "doctor",
		adult_common_ailment: "influenza"
	}}

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# InterviewsController. Be sure to keep this updated too.
	let(:valid_session) { {} }

	describe "GET index" do
		it "assigns all interviews as @interviews" do
			DatabaseCleaner.start
			DatabaseCleaner.clean
			household = Household.create!(name: "Poll")
			interview = Interview.create! valid_attributes
			get :index, {household_id: household.to_param}, valid_session
			assigns(:interviews).to_a.should eq([interview])
		end
	end

	describe "GET show" do
		it "assigns the requested interview as @interview" do
			DatabaseCleaner.start
			interview = Interview.create! valid_attributes
			get :show, {:id => interview.to_param}, valid_session
			assigns(:interview).should eq(interview)
			DatabaseCleaner.clean
		end
	end

	describe "GET new" do
		it "assigns a new interview as @interview" do
			DatabaseCleaner.start
			household = Household.create(name: "Poll")
			get :new, {:household_id => household.to_param}, valid_session
			assigns(:interview).should be_a_new(Interview)
			DatabaseCleaner.clean
		end
	end

	describe "GET edit" do
		it "assigns the requested interview as @interview" do
			DatabaseCleaner.start
			household = Household.create! name: "Poll"
			interview = Interview.create! valid_attributes
			interview.household_id = household.id
			interview.save
			get :edit, {:id => interview.to_param}, valid_session
			assigns(:interview).should eq(interview)
			DatabaseCleaner.clean
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new Interview" do
				household = Household.create name: "Poll"
				expect {
					post :create,
					{household_id: household.id,
						:interview => valid_attributes,
						expense: expense_attributes,
						health: health_attributes,
						morbidity: morbidity_attributes
				},
					valid_session
				}.to change(Interview, :count).by(1)
			end

			it "assigns a newly created interview as @interview" do
				household = Household.create! name: "Poll"
				post :create,
					{household_id: household.id,
						:interview => valid_attributes,
						expense: expense_attributes,
						health: health_attributes,
						morbidity: morbidity_attributes},
						valid_session
				assigns(:interview).should be_a(Interview)
				assigns(:interview).should be_persisted
			end

			it "redirects to the created interview" do
				household = Household.create! name: "Poll"
				post :create,
					{household_id: household.id,
						interview: valid_attributes,
						expense: expense_attributes,
						health: health_attributes,
						morbidity: morbidity_attributes},
						valid_session
				response.should redirect_to(Interview.last)
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved interview as @interview" do
				household = Household.create name: "Poll"
				# Trigger the behavior that occurs when invalid params are submitted
				Interview.any_instance.stub(:save).and_return(false)
				post :create, {household_id: household.id, :interview => {  }}, valid_session
				assigns(:interview).should be_a_new(Interview)
			end

			it "re-renders the 'new' template" do
				# Trigger the behavior that occurs when invalid params are submitted
				household = Household.create name: "Poll"
				Interview.any_instance.stub(:save).and_return(false)
				post :create, {household_id: household.id, :interview => {  }}, valid_session
				response.should render_template("new")
			end
		end
	end

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested interview" do
				interview = Interview.create! valid_attributes
				# Assuming there are no other interviews in the database, this
				# specifies that the Interview created on the previous line
				# receives the :update_attributes message with whatever params are
				# submitted in the request.
				Interview.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
				put :update, {:id => interview.to_param, :interview => { "these" => "params" }}, valid_session
			end

			it "assigns the requested interview as @interview" do
				interview = Interview.create! valid_attributes
				put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
				assigns(:interview).should eq(interview)
			end

			it "redirects to the interview" do
				interview = Interview.create! valid_attributes
				put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
				response.should redirect_to(interview)
			end
		end

		describe "with invalid params" do
			it "assigns the interview as @interview" do
				interview = Interview.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				Interview.any_instance.stub(:save).and_return(false)
				put :update, {:id => interview.to_param, :interview => {  }}, valid_session
				assigns(:interview).should eq(interview)
			end

			it "re-renders the 'edit' template" do
				interview = Interview.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				Interview.any_instance.stub(:save).and_return(false)
				put :update, {:id => interview.to_param, :interview => {  }}, valid_session
				response.should render_template("edit")
			end
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested interview" do
			household = Household.create
			interview = Interview.create! valid_attributes
			expect {
				delete :destroy, {:household_id => household.to_param,:id => interview.to_param}, valid_session
			}.to change(Interview, :count).by(-1)
		end

		it "redirects to the interviews list" do
			interview = Interview.create! valid_attributes
			delete :destroy, {:id => interview.to_param}, valid_session
			response.should redirect_to(household_interviews_url(Household.first))
		end
	end

end
