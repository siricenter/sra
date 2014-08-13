class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
        @households = Household.all
        
		@user = current_user
        if @user.has_role? "admin"
            admin
        elsif @user.has_role? "manager"
            field_worker
        elsif @user.has_role? "field worker"
            field_worker
		else
            redirect_to households_path
        end
	end

	def field_worker
        @households = @user.households
        @field_workers = @user.area_relationships.select{|r| r.relationship == "Manager"}.map{|r| r.area}.map{|area| area.area_relationships.select{|r|r.relationship == "Field Worker"}.map{|r| r.user}}.flatten
        @areas = Area.joins(:users).where(area_relationships:{relationship: "Manager"},users:{id: @user.id})
        render :worker
	end
    
    def admin
        @user = User.new
        @users = User.all
        render :admin
    end
    
    def manager
        render :manager
    end
end
