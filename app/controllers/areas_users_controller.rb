class AreasUsersController < ApplicationController
	def create
        RestClient.post "https://sra-api.com/areas/#{params[:area_id]}/users/#{params[:user_id]}", {:relationship => params[:id]}
		
		unless can? :create, :area_user
			redirect_to @area, alert: "You don't have rights to assign field workers"
		else

			respond_to do |format|
                if response.status == 200
					format.html {redirect_to @area, notice: "#{@user.email} successfully assigned to #{@area.name} as a #{@relationship}"}
				else
					format.html {redirect_to @area, alert: "Assignment failed"}
				end
			end
		end
	end

	def destroy
		if can? :delete, :area_user			
            Restclient.delete "https://sra-api.com/areas/#{params[:area_id]}/users/#{params[user_id]}"
		end

		redirect_to @area
	end
end
