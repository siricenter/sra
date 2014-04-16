class PeopleController < ApplicationController
	#before_filter :authenticate_user!
	def new
		@household = Household.find(params[:household_id])
		@person = Person.new

		@relationships = FamilyRelationship.all.map do |relationship|
			relationship.name
		end
	end

	def create
		@household = Household.find(params[:household_id])
		relationship = FamilyRelationship.find_by_name(params[:person][:family_relationship])
		@person = Person.new(params[:person].except("family_relationship"))
		@person.family_relationship = relationship

		@household.people << @person
		@person.family_relationship.save

		redirect_to household_people_path(@household)
	end

	def edit
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])
	end

	def show
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])
		@relationship = @person.family_relationship
	end

	def index
		@household = Household.find(params[:household_id])
		redirect_to @household
	end

	def update
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])

		if @person.update_attributes(params[:person])
			redirect_to household_person_path(@household, @person), notice: "#{@person.given_name} #{@person.family_name} was successfully updated"
			#format.html {redirect_to household_person_path(@household, @person), notice: "OK"}
		else
			format.html {render action: "edit"}
		end
	end

	def destroy
		@household = Household.find(params[:household_id])
		@person = @household.people.find(params[:id])
		@person.destroy

		redirect_to household_people_path(@household)
	end
end
