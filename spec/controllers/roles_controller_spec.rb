require 'spec_helper'

describe RolesController do
	login_admin

	let(:valid_attributes) {{name: "Some Role"}}
	#let(:valid_session) {{}}

	describe "GET index" do
		it "assigns all roles as @roles" do
			role = FactoryGirl.create :role
			get :index, {}
			assigns(:roles).should eq([Role.find_by_name("admin"), role])
		end
	end

	describe "GET show" do
		it "assigns the requested role as @role" do
			role = FactoryGirl.create :role
			get :show, {id: role.to_param}
			assigns(:role).should eq(role)
		end
	end

	describe "GET new" do
		it "assigns a new role as @role" do
			get :new, {}
			assigns(:role).should be_a_new(Role)
		end
	end

	describe "GET edit" do
		it "assigns the requested role as @role" do
			role = FactoryGirl.create :role
			get :edit, {id: role.to_param}
			assigns(:role).should eq(role)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new role" do
				expect {
					post :create, {role: valid_attributes}
				}.to change(Role, :count).by(1)
			end

			it "assigns the newly created role as @role" do
				post :create, {role: valid_attributes}
				assigns(:role).should be_a(Role)
				assigns(:role).should be_persisted
			end

			it "redirects to the roles index" do
				post :create, {role: valid_attributes}
				response.should redirect_to(roles_url)
			end
		end

		describe "with invalid params" do
			it "assigns a newly built but unsaved role as @role" do
				post :create, {role: {}}
				assigns(:role).should be_a_new(Role)
				assigns(:role).should_not be_persisted
			end

			it "re-renders the 'new' template" do
				post :create, {role: {}}
				response.should render_template(:new)
			end
		end
	end

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested role" do
				role = FactoryGirl.create :role
				Role.any_instance.should_receive(:update_attributes).with({"these" => "params"})
				put :update, {id: role.to_param, role: {"these" => "params"}}
			end

			it "assigns the requested role as @role" do
				role = FactoryGirl.create :role
				put :update, {id: role.to_param, role: valid_attributes}
				assigns(:role).should eq(role)
			end

			it "redirects to the roles index page" do
				role = FactoryGirl.create :role
				put :update, {id: role.to_param, role: valid_attributes}
				request.should redirect_to(roles_url)
			end
		end

		describe "with invalid params" do
			it "assigns the role as @role" do
				role = FactoryGirl.create :role
				Role.any_instance.stub(:save).and_return(false)
				put :update, {id: role.to_param, role: {}}
				assigns(:role).should eq(role)
			end

			it "re-renders the 'edit' template" do
				role = FactoryGirl.create :role
				Role.any_instance.stub(:save).and_return(false)
				put :update, {id: role.to_param, role: {}}
				response.should render_template(:edit)
			end
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested role" do
			role = FactoryGirl.create :role
			expect {
				delete :destroy, {id: role.to_param}
			}.to change(Role, :count).by(-1)
		end

		it "redirects to the role list" do
			role = FactoryGirl.create :role
			delete :destroy, {id: role.to_param}
			response.should redirect_to(roles_url)
		end
	end
end
