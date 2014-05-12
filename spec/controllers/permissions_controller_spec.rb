require 'spec_helper'
describe PermissionsController do
	let(:valid_attributes) {{
		name: "do_something"
	}}
	let(:valid_session) {{}}

	describe "GET index" do
		it "assigns all permissions as @permissions" do
			permission = FactoryGirl.create :permission
			get :index, {}, valid_session
			assigns(:permissions).to_a.should eq([permission])
		end
	end

	describe "GET show" do
		it "assigns the requested permission as @permission" do
			permission = FactoryGirl.create :permission
			get :show, {id: permission.to_param}, valid_session
			assigns(:permission).should eq(permission)
		end
	end

	describe "GET new" do
		it "assign a newly created permission as @permission" do
			permission = FactoryGirl.create :permission
			get :new, {}, valid_session
			assigns(:permission).should be_a_new(Permission)
		end
	end

	describe "GET edit" do
		it "assigns the requested permission as @permission" do
			permission = FactoryGirl.create :permission
			get :edit, {id: permission.to_param}, valid_session
			assigns(:permission).should eq(permission)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new permission" do
				expect {
					post :create, {permission: valid_attributes}, valid_session
				}.to change(Permission, :count).by(1)
			end

			it "assigns a new permission as @permission" do
				post :create, {permission: valid_attributes}, valid_session
				assigns(:permission).should be_a(Permission)
				assigns(:permission).should be_persisted
			end

			it "redirects to the newly created permission's show page" do
				post :create, {permission: valid_attributes}, valid_session
				request.should redirect_to(Permission.last)
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved permission as @permission" do
				permission = FactoryGirl.create :permission
				Permission.any_instance.stub(:save).and_return(false)
				post :create, {permission: {}}, valid_session
				assigns(:permission).should be_a_new(Permission)
			end

			it "re-renders the 'new' template" do
				permission = FactoryGirl.create :permission
				Permission.any_instance.stub(:save).and_return(false)
				post :create, {permission: {}}, valid_session
				response.should render_template(:new)
			end
		end
	end

	describe "PUT update" do
		describe "with valid params" do
			it "updates the requested permission" do
				permission = FactoryGirl.create :permission
				Permission.any_instance.should_receive(:update_attributes).with({"these" => "params"})
				put :update, {id: permission.to_param, permission: {"these" => "params"}}, valid_session
			end

			it "assigns the requested permission as @permission" do
				permission = FactoryGirl.create :permission
				put :update, {id: permission.to_param, permission: valid_attributes}, valid_session
				assigns(:permission).should eq(permission)
			end

			it "redirects to the requested permission's 'show' page" do
				permission = FactoryGirl.create :permission
				put :update, {id: permission.to_param, permission: valid_attributes}, valid_session
				response.should redirect_to(permission)
			end
		end

		describe "with invalid params" do
			it "assigns the permission as @permission" do
				permission = FactoryGirl.create :permission
				Permission.any_instance.stub(:save).and_return(false)
				put :update, {id: permission.to_param, permission: {}}, valid_session
				assigns(:permission).should eq(permission)
			end

			it "re-renders the 'edit' template" do
				permission = FactoryGirl.create :permission
				Permission.any_instance.stub(:save).and_return(false)
				put :update, {id: permission.to_param, permission: {}}, valid_session
				response.should render_template(:edit)
			end
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested permission" do
			permission = FactoryGirl.create :permission
			expect {
				delete :destroy, {id: permission.to_param}, valid_session
			}.to change(Permission, :count).by(-1)
		end

		it "redirects to the permissions list" do
			permission = FactoryGirl.create :permission
			delete :destroy, {id: permission.to_param}, valid_session
			response.should redirect_to(permissions_url)
		end
	end
end
