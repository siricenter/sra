class DashboardController < ApplicationController
	def show
        @households = Household.all
        
		@user=current_user
        if @user.has_role? "admin"
            admin
        elsif @user.has_role? "manager"
            manager
        elsif @user.has_role? "field worker"
            
            field_worker
        elsif @user.has_role? "public"
            redirect_to households_path
        end
       
      
	end

	def field_worker
        @households=@user.households
        # @household=Household.find(params[:household_id])
        # @interview=Interview.where({household_id: @household.id})
        
        
        render :worker
        
		
	end
    
    def admin
        render :admin
        
    end
    
    def manager
        render :manager
        
    end
    
end
