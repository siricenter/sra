class UsersController < ApplicationController
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
end
