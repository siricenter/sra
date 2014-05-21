class AreasRegionsController < ApplicationController
	def create
		@area = Area.find(params[:area_id])
		@region = Region.find(params[:region_id])

		unless can? :create, :area_region
			redirect_to @region, alert: "You don't have rights to assign field workers"
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
end

def destroy
end
