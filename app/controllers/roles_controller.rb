class RolesController < ApplicationController
	before_filter :authenticate_user!


	def index
		@roles = Role.all
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @roles }
		end
	end

	def show
		@role = Role.find(params[:id])
	
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @role }
		end
	end

	def edit
		@role = Role.find(params[:id])
		
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @role }
		end
	end

	def new
		@role = Role.new

	end

	def create
		@role = Role.new(params[:role]).create
		
		respond_to do |format|
			if @role
				format.html { redirect_to roles_path, notice: "Role successfully created" }
				format.json {render json: @role, status: :created, location: role_path(@role)}
			else
				format.html { render action: :new }
				format.json { render json: @role.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@role = Role.find(params[:id])

		RestClient.put 'https://sra-api.herokuapp.com/roles/:id', {@role => params[:role]}
		respond_to do |format|
			if @role
				format.html { redirect_to roles_path, notice: "Role was successfully updated" }
				format.json { head :no_content }
			else
				format.html { render action: :edit }
				format.json { render json: @role.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@role = Role.find(params[:id])
	
		RestClient.delete 'https://sra-api.herokuapp.com/roles/:id', {:id => params[:id]}

		respond_to do |format|
			format.html { redirect_to roles_path }
			format.json { head :no_content }
		end
	end
end
