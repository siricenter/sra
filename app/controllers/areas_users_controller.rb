class AreasUsersController < ApplicationController
	def create
		#@area = Area.find(params[:area_id])
        request = RestClient.get 'https://sra-api.com/areas' {:params => {:id => params[:area_id]}}
        @area = JSON.parse(request)
		#@user = User.find(params[:user_id])
        request = RestClient.get 'https://sra-api.com/users' {:params => {:id => params[:user_id]}}
        @area = JSON.parse(request)
        @relationship = params[:relationship]
        #@area_user = AreaRelationship.new
        RestClient.post 'https://sra-api.com/area_relationship' 
        request = RestClient.get 'https://sra-api.com.area_relationship/:id' {:params => {:id => params[:id]}}      
        @area_user = JSON.parse(request)
        @area_user.area = @area
        @area_user.user = @user
        @area_user.relationship = @relationship
        Restclient.put 'https://sra-api.com.area_relationship/:id' {:params => {:id => params[:id],:area_user => @area_user}}
		unless can? :create, :area_user
			redirect_to @area, alert: "You don't have rights to assign field workers"
		else

			respond_to do |format|
                if @area_user
					format.html {redirect_to @area, notice: "#{@user.email} successfully assigned to #{@area.name} as a #{@relationship}"}
				else
					format.html {redirect_to @area, alert: "Assignment failed"}
				end
			end
		end
	end

	def destroy
		if can? :delete, :area_user
			#@area = Area.find(params[:area_id])
            request = Restclient.get 'https://sra-api.com/areas/:id' {:params => {:id => params[:areas_id]}}
            @area = JSON.parse(request)
			#@user = User.find(params[:user_id])
            request = Restclient.get 'https://sra-api.com/users/:id' {:params => {:id => params[:user_id]}}
            @area = JSON.parse(request)
			#@area.users.delete(@user) if @area.users.include?(@user)
            Restclient.delete 'https://sra-api.com/areas/users/:id' {:params => {:user => @user}}
		end

		redirect_to @area
	end
end
