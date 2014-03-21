class UserRoleController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@role = Role.find(params[:role_id])

		unless @user.roles.include?(@role)
			@user.roles << @role 

			if @user.save
				redirect_to user_path(@user)
			else
				redirect_to user_path(@user), alert: "Saving failed"
			end
		else
			redirect_to user_path(@user), alert: "Saving failed"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@role = Role.find(params[:role_id])

		@user.roles.delete(@role) if @user.roles.include?(@role)

		redirect_to user_path(@user)
	end
end
