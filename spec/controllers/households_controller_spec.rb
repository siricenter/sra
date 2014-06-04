require 'spec_helper'
describe HouseholdsController do
	login_user

	before :each do
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	let(:valid_attributes) {{
		name: "Poll"
	}}

	let(:valid_session) {{}}

	describe "GET index" do
		it "assigns all households as @households" do
			household = FactoryGirl.create(:household, user: @current_user)
			get :index, valid_attributes
			assigns(:households).to_a.should eq([household])
		end
	end

	describe "GET show" do
		it "assigns the requested household as @household" do
			household = FactoryGirl.create(:household)
			get :show, { id:  household.to_param}
			assigns(:household).should eq(household)
		end
	end

	describe "GET new" do
		it "assigns the new household as @household" do
			get :new, {}
			assigns(:household).should be_a_new(Household)
		end
	end

	describe "GET edit" do
		it "assigns the requested household as @household" do
			household = FactoryGirl.create(:household)
			get :edit, { id: household.to_param }
			assigns(:household).should eq(household)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "creates a new Household" do
				expect {
					post :create,
					{household: valid_attributes}
				}.to change(Household, :count).by(1)
			end

			it "assigns a newly created household as @household" do
				post :create, {
					household: valid_attributes
				}
				assigns(:household).should be_a(Household)
				assigns(:household).should be_persisted
			end

			it "redirects to the created household" do
				post :create, {
					household: valid_attributes	
				}
				response.should redirect_to(Household.last)
			end
		end

		describe "with invalid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "assigns a newly created but unsaved household as @household" do
				Household.any_instance.stub(:save).and_return(false)
				post :create, {household: {}}
				assigns(:household).should be_a_new(Household)
			end

			it "re-renders the 'new' template" do
				Household.any_instance.stub(:save).and_return(false)
				post :create, {household: {}}
				response.should render_template("new")
			end
		end
	end

	describe "PUT update" do
		before :each do
			DatabaseCleaner.start
		end

		after :each do
			DatabaseCleaner.clean
		end

		describe "with valid params" do
			it "updates the requested household" do
				household = FactoryGirl.create(:household)
				Household.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
				put :update, {:id => household.to_param, :household => { "these" => "params" }}
			end

			it "assigns the requested household as @household" do
				household = FactoryGirl.create(:household)
				put :update, {id: household.to_param, household: valid_attributes}
				assigns(:household).should eq(household)
			end

			it "redirects to the household" do
				household = FactoryGirl.create(:household)
				put :update, {id: household.to_param, interview: valid_attributes}
				response.should redirect_to(household)
			end
		end

		describe "with invalid params" do
			it "assigns the household as @household" do
				household = FactoryGirl.create(:household)
				Household.any_instance.stub(:save).and_return(false)
				put :update, {id: household.to_param, interview: {}}
				assigns(:household).should eq(household)
			end

			it "re-renders the 'edit' template" do
				household = FactoryGirl.create(:household)
				Household.any_instance.stub(:save).and_return(false)
				put :update, {id: household.to_param, interview: {}}
				response.should render_template("edit")
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			DatabaseCleaner.start
			@household = FactoryGirl.create(:household)
		end

		after :each do
			DatabaseCleaner.clean
		end

		it "destroys the requested household" do
			expect {
				delete :destroy, {id: @household.to_param}
			}.to change(Household, :count).by(-1)
		end

		it "redirects to the households list" do
			delete :destroy, {id: @household.to_param}
			response.should redirect_to(households_url)
		end
	end
end
