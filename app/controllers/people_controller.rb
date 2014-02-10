
<article>
class PeopleController < ApplicationController
	def new
		@household = Household.find(params[:household_id])
		@person = Person.new
	end

	def create
		@household = Household.find(params[:household_id])
		@person = Person.new(params[:person])

		@household.people << @person

		redirect_to household_people_path(@household)
	end

	def edit
	end

	def show
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])
	end

	def index
		@household = Household.find(params[:household_id])
		@people = @household.people
	end

	def destroy
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])
		@person.destroy

		redirect_to household_people_path(@household)
	end
end
</article>