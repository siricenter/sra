class UserRoleController < ApplicationController
	#before_filter :authenticate_user!

	def create
		@user = User.find(params[:user_id])
       
        
		@role = Role.find(params[:role_id])
		@user.roles = @role

		unless can? :create, :user_role
			redirect_to @user, alert: "You don't have rights to assign roles"
		else

			@user.roles << @role unless @user.roles.find_by_name(@role.name)
			respond_to do |format|
				if @user.save
					format.html {redirect_to user_path(@user), notice: "Role successfully assigned"}
				else
					format.html {redirect_to user_path(@user), alert: "Saving failed"}
				end
			end
		end
	end

	def destroy
		if can? :delete, :user_role
			@user = User.find(params[:user_id])
         
			@role = Role.find(params[:role_id])
         
			@user.roles.delete(@role) if @user.roles.include?(@role)
		end

		redirect_to user_path(@user)
	end
end
