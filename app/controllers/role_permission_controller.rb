class RolePermissionController < ApplicationController
	def create
		@role = Role.find(params[:role_id])
		@permission = Permission.find(params[:permission_id])

		unless @role.permissions.include?(@permission)
			@role.permissions << @permission

			if @role.save
				redirect_to role_path(@role)
			else
				redirect_to role_path(@role), alert: "Saving failed"
			end
		else
			redirect_to user_path(@role), alert: "Saving failed"
		end
	end

	def destroy
		@role = Role.find(params[:role_id])
		@permission = Permission.find(params[:permission_id])

		@role.permissions.delete(@permission) if @role.permissions.include?(@permission)

		redirect_to role_path(@role)
	end
end
