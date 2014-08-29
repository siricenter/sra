class HouseholdsController < ApplicationController
	before_filter :authenticate_user!

	# GET /households
	# GET /households.json
	def index
		#@households = current_user.households
        request = RestClient.get 'http://sra-api.com/users/:id/households', {:params => {:id => params[:id]}}
        @households = JSON.parse(request)
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @households }
		end
	end

	# GET /households/1
	# GET /households/1.json
	def show
		#@household = Household.find(params[:id])
        request = RestClient.get 'http://sra-api.com/households/:id', {:params => {:id => params[:id]}}
        @household = JSON.parse(request)
		#@people = @household.people
        request = RestClient.get 'http://sra-api.com/households/:id/people', {:params => {:id => params[:id]}}
        @people = JSON.parse(request)
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @household }
		end
	end

	# GET /households/new
	# GET /households/new.json
	def new
		#@household = Household.new
        request = RestClient.post 'http://sra-api.com/households/', {:params => {:area => params[:area]}}
		respond_to do |format|
            format.html # new.html.erb
			format.json { render json: @household }
		end
	end

	# GET /households/1/edit
	def edit
		#@household = Household.find(params[:id])
        request = RestClient.get 'http://sra-api.com/households/:id', {:params => {:id => params[:id]}}
        @household = JSON.parse(request)
	end

	# POST /households
	# POST /households.json
	def create
        request = RestClient.get 'http://sra-api.com/households/:id', {:params => {:id => params[:id]}}
        @household = JSON.parse(request)
		#@household = Household.new(params[:household])
		@household.user = current_user 
		respond_to do |format|
			if @household.save
				format.html { redirect_to @household, notice: 'Household was successfully created.' }
				format.json { render json: @household, status: :created, location: @household }
			else
				format.html { render action: "new" }
				format.json { render json: @household.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /households/1
	# PUT /households/1.json
	def update
		#@household = Household.find(params[:id])
         request = RestClient.get 'http://sra-api.com/households/:id', {:params => {:id => params[:id]}}
        @household = JSON.parse(request)
		respond_to do |format|
			if @household.update_attributes(params[:household])
				format.html { redirect_to @household, notice: 'Household was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
                format.json { render json: @household.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /households/1
	# DELETE /households/1.json
	def destroy
		#@household = Household.find(params[:id])
         request = RestClient.get 'http://sra-api.com/households/:id', {:params => {:id => params[:id]}}
        @household = JSON.parse(request)
		#@interviews = Interview.where({household_id: @household.id})
        request = RestClient.get 'http://sra-api.com/households/:id/interviews', {:params => {:id => params[:id]}}
        @interviews = JSON.parse(request)
		@interviews.each do |interview|
            RestClient.delete 'http://sra-api.com/households/:id/interviews', {:params => {:id => params[:id]}}
		end
        RestClient.delete 'http://sra-api.com/households/:id/', {:params => {:id => params[:id]}}

		respond_to do |format|
			format.html { redirect_to households_url }
			format.json { head :no_content }
		end
	end
end
