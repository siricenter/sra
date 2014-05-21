require 'spec_helper'
describe RegionsController do
	#login_user

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
		it "assigns all regions as @regions" do
			region = Region.create(name: Faker::Name.last_name)
			get :index, valid_attributes
			assigns(:regions).to_a.should eq([region])
		end
	end

	describe "GET show" do
		it "assigns the requested region as @region" do
			region = Region.create! valid_attributes
			get :show, { id:  region.to_param}
			assigns(:region).should eq(region)
		end
	end

	describe "GET new" do
		it "assigns the new region as @region" do
			get :new, {}
			assigns(:region).should be_a_new(Region)
		end
	end

	describe "GET edit" do
		it "assigns the requested region as @region" do
			region = Region.create! valid_attributes
			get :edit, { id: region.to_param }
			assigns(:region).should eq(region)
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

			it "creates a new Region" do
				expect {
					post :create,
					{region: valid_attributes}
				}.to change(Region, :count).by(1)
			end

			it "assigns a newly created region as @region" do
				post :create, {
					region: valid_attributes
				}
				assigns(:region).should be_a(Region)
				assigns(:region).should be_persisted
			end

			it "redirects to the created region" do
				post :create, {
					region: valid_attributes	
				}
				response.should redirect_to(Region.last)
			end
		end

		describe "with invalid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "assigns a newly created but unsaved region as @region" do
				Region.any_instance.stub(:save).and_return(false)
				post :create, {region: {}}
				assigns(:region).should be_a_new(Region)
			end

			it "re-renders the 'new' template" do
				Region.any_instance.stub(:save).and_return(false)
				post :create, {region: {}}
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
			it "updates the requested region" do
				region = Region.create! valid_attributes
				Region.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
				put :update, {:id => region.to_param, :region => { "these" => "params" }}
			end

			it "assigns the requested region as @region" do
				region = Region.create! valid_attributes
				put :update, {id: region.to_param, region: valid_attributes}
				assigns(:region).should eq(region)
			end

			it "redirects to the region" do
				region = Region.create! valid_attributes
				put :update, {id: region.to_param, interview: valid_attributes}
				response.should redirect_to(region)
			end
		end

		describe "with invalid params" do
			it "assigns the region as @region" do
				region = Region.create! valid_attributes
				Region.any_instance.stub(:save).and_return(false)
				put :update, {id: region.to_param, interview: {}}
				assigns(:region).should eq(region)
			end

			it "re-renders the 'edit' template" do
				region = Region.create! valid_attributes
				Region.any_instance.stub(:save).and_return(false)
				put :update, {id: region.to_param, interview: {}}
				response.should render_template("edit")
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			DatabaseCleaner.start
			@region = Region.create valid_attributes
		end

		after :each do
			DatabaseCleaner.clean
		end

		it "destroys the requested region" do
			expect {
				delete :destroy, {id: @region.to_param}
			}.to change(Region, :count).by(-1)
		end

		it "redirects to the regions list" do
			delete :destroy, {id: @region.to_param}
			response.should redirect_to(regions_url)
		end
	end
end
