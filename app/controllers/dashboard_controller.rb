class DashboardController < ApplicationController
	def show
        @households = Household.all
		@user=current_user
        if @user.has_role? "admin"
            render :admin
        elsif @user.has_role? "manager"
            render :manager
        elsif @user.has_role? "field worker"
            render :worker
        elsif @user.has_role? "public"
            redirect_to households_path
        end
       
      
	end

	def field_worker
        @households=@user.households
        
		
	end
    
    def admin
        
        
    end
    
    def manager
        
        
    end
    
end
