class PeopleController < ApplicationController
	#before_filter :authenticate_user!
	def new
		@household = Household.find(params[:household_id])
		@person = Person.new(family_name: @household.name)
		@path = [@household, @person]
		
		@relationships = FamilyRelationship.all.map do |relationship|
			relationship.name
		end
	end

	def create
		@household = Household.find(params[:household_id])

		relationship = FamilyRelationship.find_by_name(params[:person][:family_relationship])
		@person = Person.new(params[:person].except(:family_relationship))
		@person.family_relationship = relationship

		@household.people << @person

		respond_to do |format|
			if @person.save
				format.html {redirect_to @household}
				format.json {render json: @household, status: :created, location: @household}
			else
				format.html { render action: "new" }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
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

		respond_to do |format|
			if @person.save
				format.html {redirect_to @person}
				format.json {render json: @person, status: :created, location: @household}
			else
				format.html { render action: "edit" }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@household = @person.household
		@person.destroy

		redirect_to household_path(@household)
	end
end
