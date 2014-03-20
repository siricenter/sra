class RolesController < ApplicationController
	def index
		@roles = Role.all
	end

	def show
		@role = Role.find(params[:id])
	end

	def edit
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(params[:role])

		if @role.save
			respond_to do |format|
				format.html {redirect_to role_path(@role), notice: "Role successfully created"}
				format.json {render json: @role, status: :created, location: role_path(@role)}
			end
		else
			redirect_to new_role_path(@role), error: "Unsuccessful"
		end
	end
end
