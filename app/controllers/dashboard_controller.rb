class DashboardController < ApplicationController
	def show
		@user=current_user
		if @user.has_role? "Field Worker"
			field_worker
		end
	end

	def field_worker
		@households = Household.all
		render :field_worker
	end
end
