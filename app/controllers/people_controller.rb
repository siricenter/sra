class PeopleController < ApplicationController
	#before_filter :authenticate_user!
	def new
		#@household = Household.find(params[:household_id])
        request = RestClient.get 'https://sra-api/com/households/:id' {:params => {:id => params[:household_id]}}
        @household = JSON.parse(request)
		#@person = Person.new(family_name: @household.name)
        RestClient.post 'https://sra-api/com/households/persons' {:params => {:family_name => @household.name}
		@path = [@household, @person]
		@relationships = FamilyRelationship.all.map do |relationship|
			relationship.name
		end
	end

	def create
		#@household = Household.find(params[:household_id])
        request = RestClient.get 'https://sra-api.com/households/:id' {:params => {:id => params[:household_id]}}
        @household = JSON.parse(request)
		#relationship = FamilyRelationship.find_by_name(params[:person][:family_relationship])
        relationship = RestClient.get 'https://sra-api.com/households/relationships/:name' {:params => {:relationship => params[:person][:family_relationship]}}
		#@person = Person.new(params[:person].except(:family_relationship))
        RestClient.post 'https://sra-api.com/households/people'
		@person.family_relationship = relationship
		@household.people << @person
        RestClient.post 'https://sra-api.com/households/people' {:params => {:person => @person}}
		respond_to do |format|
            if @person.save
				format.html {redirect_to @household}
				format.json {render json: @household, status: :created, location: @household}
			else
				format.html { redirect_to new_household_person_path }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
		#@person = Person.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:id]}}
        @person = JSON.parse(request)
		@household = @person.household
		@relationships = FamilyRelationship.all.map do |relationship|
			relationship.name
		end
		@path = @person
	end

	def show
		#@person = Person.find(params[:id])
		request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:id]}}
        @person = JSON.parse(request)
	end

	def index
		#@household = Household.find(params[:household_id])
        request = RestClient.get 'https://sra-api.com/households/:id' {:params => {:id => params[:household_id]}}
        @household = JSON.parse(request)
		redirect_to @household
	end

	def update
		#@person = Person.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:id]}}
        @person = JSON.parse(request)
        
		@person.attributes = params[:person].except("family_relationship")
		#relationship = FamilyRelationship.find_by_name(params[:person][:family_relationship])
        relationship = RestClient.get 'https://sra-api.com/households/relationships/:name' {:params => {:relationship => params[:person][:family_relationship]}}
		@person.family_relationship = relationship
        RestClient.put 'https://sra-api.com/households/people/:id' {:params => {:person => @person}}
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:id]}}		
        @person = JSON.parse(request)
        respond_to do |format|
			if @person
				format.html {redirect_to @person}
				format.json {render json: @person, status: :created, location: @household}
			else
				format.html { render action: "edit" }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		#@person = Person.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:id]}}		
        @person = JSON.parse(request)
        @household = RestClient.get 'https://sra-api.com/people/:id/household/' {:params => {:id => params[:id]}}
        RestClient.delete 'https://sra-api.com/households/:id' {:params => {:id => params[:id]}}
		#@person.destroy

		redirect_to household_path(@household)
	end
end
