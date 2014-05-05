class PeopleController < ApplicationController
	#before_filter :authenticate_user!
	def new
		@household = Household.find(params[:household_id])
		@person = Person.new
		@path = [@household, @person]

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
		if @person.family_relationship.save
			redirect_to household_people_path(@household)
		else
			redirect_to new_household_people_path(@household), alert: @person.errors
		end
	end

	def edit
		@person = Person.find(params[:id])
		@household = @person.household
		@relationships = FamilyRelationship.all.map do |relationship|
			relationship.name
		end
		@path = @person
	end

	def show
		@person = Person.find(params[:id])
		@relationship = @person.family_relationship
	end

	def index
		@household = Household.find(params[:household_id])
		redirect_to @household
	end

	def update
		@person = Person.find(params[:id])
		@person.attributes = params[:person].except("family_relationship")
		relationship = FamilyRelationship.find_by_name(params[:person][:family_relationship])
		@person.family_relationship = relationship

		if @person.save
			redirect_to person_path(@person), notice: "#{@person.given_name} #{@person.family_name} was successfully updated"
			#format.html {redirect_to household_person_path(@household, @person), notice: "OK"}
		else
			format.html {render action: "edit"}
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@household = @person.household
		@person.destroy

		redirect_to household_path(@household)
	end
end
