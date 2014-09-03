class UsersController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
		#@users = User.all
        request = RestClient.get 'https://sra-api.com/users' {:accept => :json}
        @users = JSON.parse(request)
        
	end

	def show
		#@user = User.find(params[:id])
        request = RestClient.get 'https://sra-api.com/users/:id',{:params => {:id => params[:id]}} 
        @user = JSON.parse(request)
        request = RestClient.get 'https://sra-api.com/roles' {:accept => :json}
		#@roles = Role.all
        @roles = JSON.parse(request)
	end

	def destroy
		#@user = User.find(params[:id])
        request = RestClient.get 'https://sra-api.com/users/:id',{:params => {:id => params[:id]}} 
        @user = JSON.parse(request)
        RestClient.delete 'https://sra-api.com/users/:id',{:params => {:id => params[:id]}} 
        if @user = nil
			redirect_to users_path, notice: "User ##{params[:id]} was successfully removed"
		else
			redirect_to users_path, notice: "User wasn't destroyed"
		end
	end

	def update_password
		#@user = User.find(current_user.id)
        RestClient.put 'https://sra-api.com/users/:id', {:params => {:password => params[:user][:password]}}
        request = RestClient.get 'https://sra-api/user', {:params => {:id => params[:id]}}
        @user = JSON.parse(request)
		if @user.update(user_params)
			sign_in @user, :bypass => true
			redirect_to root_path
		else
			render "edit"
		end
	end

	def create
        request = RestClient.post 'https://sra-api/users', {:params => {:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}}
        @user = RestClient.get 'https://sra-api/user', {:params => {:id => params[:id]}}
        @user = JSON.parse(@user)
        #@user = User.new({:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]})
        if @user.id == params[:user][:id]
			flash[:notice] = "#{@user.email} successfully created."
			redirect_to dashboard_path
		else
			flash[:notice] = "#{@user.email} not saved."
			render "dashboard/admin"         
		end
	end
end
