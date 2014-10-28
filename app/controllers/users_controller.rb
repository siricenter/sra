class UsersController < ApplicationController
	before_filter :check_login

	def sign_up
		RestClient.post 'https://sra-api.herokuapp.com/session', {:user => params[:user]}
		if response.status == 200
			@current_user = params[:user]
		end 
	end

	def index
		@users = User.all


	end

	def show
		@user = User.find(params[:id])	
		
	end

	def destroy
		@user = User.find(params[:id])
		
		if response.status = 200
			redirect_to users_path, notice: "User #{params[:id]} was successfully removed"
		else
			redirect_to users_path, notice: "User wasn't destroyed"
		end
	end

	def update_password
		user = User.find(current_user.id)
		RestClient.put 'https://sra-api.herokuapp.com/users/:id', {:password => params[:user][:password]}
		if response.status == 200
			redirect_to root_path
		else
			render "edit"
		end
	end

	def create
		RestClient.post 'https://sra-api.herokuapp.com/users', {:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}
		#@user = User.new({:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]})
		if response.status == 200
			flash[:notice] = "#{@user.email} successfully created."
			redirect_to dashboard_path
		else
			flash[:notice] = "#{@user.email} not saved."
			render "dashboard/admin"         
		end
	end
end
