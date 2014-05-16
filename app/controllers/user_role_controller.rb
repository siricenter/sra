class UserRoleController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@role = Role.find(params[:role_id])

		@user.roles << @role unless @user.roles.find_by_name(@role.name)
		respond_to do |format|
			if @user.save!
				format.html {redirect_to user_path(@user), notice: "Role successfully assigned"}
			else
				format.html {redirect_to user_path(@user), alert: "Saving failed"}
			end
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@role = Role.find(params[:role_id])

		@user.roles.delete(@role) if @user.roles.include?(@role)

		redirect_to user_path(@user)
	end
end
