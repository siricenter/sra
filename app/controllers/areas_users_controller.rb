class AreasUsersController < ApplicationController
	def create
		@area = Area.find(params[:area_id])
		@user = User.find(params[:user_id])

		unless can? :create, :area_user
			redirect_to @area, alert: "You don't have rights to assign field workers"
		else
			@area.users << @user

			respond_to do |format|
				if @area.save!
					format.html {redirect_to @area, notice: "#{@user.email} successfully assigned to #{@area.name}"}
				else
					format.html {redirect_to @area, alert: "Assignment failed"}
				end
			end
		end
	end

	def destroy
		if can? :delete, :area_user
			@area = Area.find(params[:area_id])
			@user = User.find(params[:user_id])

			@area.users.delete(@user) if @area.users.include?(@user)
		end

		redirect_to @area
	end
end
