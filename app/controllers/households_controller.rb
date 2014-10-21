class HouseholdsController < ApplicationController
	before_filter :authenticate_user!

	# GET /households
	# GET /households.json
	def index
		#@households = current_user.households
		request = RestClient.get "http://sra-api.herokuapp.com/users/#{params[:user_id]}/households"
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
		request = RestClient.get "http://sra-api.herokuapp.com/households/#{params[:id]}"
		@household = JSON.parse(request)
		@people = @household.people
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @household }
		end
	end

	# GET /households/new
	# GET /households/new.json
	def new
		@household = Household.new
		RestClient.post 'http://sra-api.herokuapp.com/households/new', {:area => params[:area]}
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @household }
		end
	end

	# GET /households/1/edit
	def edit
		#@household = Household.find(params[:id])
		request = RestClient.get "http://sra-api.herokuapp.com/households/#{params[:id]}"
		@household = JSON.parse(request)
	end

	# POST /households
	# POST /households.json
	def create
		RestClient.post "https://sra-api.herokuapp.com/households", {:household => params[:household]} 

		respond_to do |format|
			if response.status == 200
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
		RestClient.post "http://sra-api.herokuapp.com/households/#{params[:id]}", {:household => params[:household]}
		@household = JSON.parse(request)
		respond_to do |format|
			if response.status
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

		#@interviews = Interview.where({household_id: @household.id})
		request = RestClient.get "http://sra-api.herokuapp.com/households/#{params[:id]}"
		@household = JSON.parse(request)
		@interview = @household.interview
		RestClient.delete "http://sra-api.herokuapp.com/households/#{params[:household_id]}/interviews/#{params[:interview_id]}"
		RestClient.delete "http://sra-api.herokuapp.com/households/#{params[:id]}"

		respond_to do |format|
			format.html { redirect_to households_url }
			format.json { head :no_content }
		end
	end
end
