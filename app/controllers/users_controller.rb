class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@roles = Role.all
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to users_path, notice: "User ##{params[:id]} was successfully removed"
		else
			redirect_to users_path, notice: "User wasn't destroyed"
		end
	end

	def update_password
		@user = User.find(current_user.id)
		if @user.update(user_params)
			sign_in @user, :bypass => true
			redirect_to root_path
		else
			render "edit"
		end
	end

	def create
		@user = User.new({:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]})
		if @user.save
			flash[:notice] = "#{@user.email} successfully created."
			redirect_to dashboard_path
		else
			flash[:notice] = "#{@user.email} not saved."
			render "dashboard/admin"         
		end
	end
end
