class RolesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
	end

	def show
		@role = Role.find(params[:id])
	end

	def edit
	end

	def new
		@user = User.find(params[:user_id])
		@role = Role.new
	end

	def create
		@user = User.find(params[:user_id])
		@role = Role.new(params[:role])

		@user.roles << @role

		if @user.save
			respond_to do |format|
				format.html {redirect_to user_role_path(@user, @role), notice: "Role successfully created"}
				format.json {render json: @role, status: :created, location: user_role_path(@user, @role)}
			end
		else
			redirect_to new_user_role_path(@user, @role), error: "Unsuccessful"
		end
	end
end
