class DashboardController < ApplicationController
	before_filter :authenticate_user!
	def show
        @households = Household.all
		@user = User.find(params[:id])
    	respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @areas }
        end
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
        #@field_workers = @user.area_relationships.select{|r| r.relationship == "Manager"}.map{|r| r.area}.map{|area| area.area_relationships.select{|r|r.relationship == "Field Worker"}.map{|r| r.user}}.flatten
        #@areas = Area.joins(:users).where(area_relationships:{relationship: "Manager"},users:{id: @user.id})
       # request = RestClient.get "https://sra-api.herokuapp.com/user/#{params[:id]}/households" 
        #@households = JSON.parse(request)
        render :worker
	end
    
    def admin
		@user = User.new
		@users = Users.all
        render :admin
    end
    
    
end
