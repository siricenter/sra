require 'spec_helper'
describe AreasController do
	login_user

	before :each do
		DatabaseCleaner.start
	end

	after :each do
		DatabaseCleaner.clean
	end

	let(:valid_attributes) {{
		name: "Novo Darnitstya"
	}}

	let(:valid_session) {{}}

	describe "GET index" do
		it "assigns all areas as @areas" do
			area = FactoryGirl.create :area
			get :index, valid_attributes
			assigns(:areas).to_a.should eq([area])
		end
	end

	describe "GET show" do
		it "assigns the requested area as @area" do
			Role.create!(name: "Field Worker")
			area = FactoryGirl.create :area
			get :show, { id:  area.to_param}
			assigns(:area).should eq(area)
		end
	end

	describe "GET new" do
		it "assigns the new area as @area" do
			get :new, {}
			assigns(:area).should be_a_new(Area)
		end
	end

	describe "GET edit" do
		it "assigns the requested area as @area" do
			area = FactoryGirl.create :area
			get :edit, { id: area.to_param }
			assigns(:area).should eq(area)
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

			it "creates a new Area" do
				expect {
					post :create,
					{area: valid_attributes}
				}.to change(Area, :count).by(1)
			end

			it "assigns a newly created area as @area" do
				post :create, {
					area: valid_attributes
				}
				assigns(:area).should be_a(Area)
				assigns(:area).should be_persisted
			end

			it "redirects to the created area" do
				post :create, {
					area: valid_attributes	
				}
				response.should redirect_to(Area.last)
			end
		end

		describe "with invalid params" do
			before :each do
				DatabaseCleaner.start
			end

			after :each do
				DatabaseCleaner.clean
			end

			it "assigns a newly created but unsaved area as @area" do
				Area.any_instance.stub(:save).and_return(false)
				post :create, {area: {}}
				assigns(:area).should be_a_new(Area)
			end

			it "re-renders the 'new' template" do
				Area.any_instance.stub(:save).and_return(false)
				post :create, {area: {}}
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
			it "updates the requested area" do
				area = FactoryGirl.create :area
				Area.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
				put :update, {:id => area.to_param, :area => { "these" => "params" }}
			end

			it "assigns the requested area as @area" do
				area = FactoryGirl.create :area
				put :update, {id: area.to_param, area: valid_attributes}
				assigns(:area).should eq(area)
			end

			it "redirects to the area" do
				area = FactoryGirl.create :area
				put :update, {id: area.to_param, interview: valid_attributes}
				response.should redirect_to(area)
			end
		end

		describe "with invalid params" do
			it "assigns the area as @area" do
				area = FactoryGirl.create :area
				Area.any_instance.stub(:save).and_return(false)
				put :update, {id: area.to_param, interview: {}}
				assigns(:area).should eq(area)
			end

			it "re-renders the 'edit' template" do
				area = FactoryGirl.create :area
				Area.any_instance.stub(:save).and_return(false)
				put :update, {id: area.to_param, interview: {}}
				response.should render_template("edit")
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			DatabaseCleaner.start
			@area = Area.create valid_attributes
		end

		after :each do
			DatabaseCleaner.clean
		end

		it "destroys the requested area" do
			expect {
				delete :destroy, {id: @area.to_param}
			}.to change(Area, :count).by(-1)
		end

		it "redirects to the areas list" do
			delete :destroy, {id: @area.to_param}
			response.should redirect_to(areas_url)
		end
	end
end
