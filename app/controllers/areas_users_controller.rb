class AreasUsersController < ApplicationController
	def create
		@area = Area.find(params[:area_id])
		@user = User.find(params[:user_id])
        @relationship = params[:relationship]
        @area_user = AreaRelationship.new
        
        @area_user.area = @area
        @area_user.user = @user
        @area_user.relationship = @relationship

		unless can? :create, :area_user
			redirect_to @area, alert: "You don't have rights to assign field workers"
		else

			respond_to do |format|
                if @area_user.save
					format.html {redirect_to @area, notice: "#{@user.email} successfully assigned to #{@area.name} as a #{@relationship}"}
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
