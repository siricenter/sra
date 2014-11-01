class AreasRegionsController < ApplicationController
	def create
		@area = Area.find(params[:area_id])
        #request = RestClient.get "http://sra-api.herokuapp.com/areas/#{params[:id]}"
        #@area = JSON.parse(request)
   		request = RestClient.get "http://sra-api.herokuapp.com/region/#{params[:id]}"
		@region = JSON.parse(request)
		
		unless can? :create, :area_region
			redirect_to @region, alert: "You don't have rights to assign areas"
		else
			@region.areas << @area

			respond_to do |format|
				if @region.save!
					format.html { redirect_to @region, notice: "#{@area.name} was successfully assigned to #{@region.name}" }
				else
					format.html {redirect_to @region, alert: "Assignment failed"}
				end
			end
		end
	end

	def destroy
        request = RestClient.get "http://sra-api.herokuapp.com/areas/#{params[:id]}"
		#@region = Region.find(params[:region_id])
		@area = JSON.parse(request)
		request = RestClient.get "http://sra-api.herokuapp.com/region/#{params[:id]}" 
		@region = JSON.parse(request)
		unless can? :delete, :area_region
			redirect_to @region, alert: "You don't have rights to assign areas"
		else
			@region.areas.delete(@area)

			respond_to do |format|
                if response.status == 200
					format.html { redirect_to @region, notice: "#{@area.name} was successfully unassigned from #{@region.name}" }
				else
					format.html {redirect_to @region, alert: "Assignment failed"}
				end
			end
		end
	end
end
