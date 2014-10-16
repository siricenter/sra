class InterviewsController < ApplicationController
	# GET /interviews
	# GET /interviews.json
	def index
		#@household = Household.find(params[:household_id])
		#@interviews = Interview.where({household_id: @household.id})
        request = RestClient.get "https://sra-api.herokuapp.com/households/#{params[:id]}/interviews" 
        @household = JSON.parse(request)
        #@interviews = RestClient.get 'https://sra-api.herokuapp.com/households/:id/interviews', {:params => {:id => params[:id]}}
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @interviews }
		end
	end

	# GET /interviews/1
	# GET /interviews/1.json
	def show
		#@interview = Interview.find(params[:id])
        request = RestClient.get "https://sra-api.herokuapp.com/interviews/#{params[:id]}/households"
        @interviews = JSON.parse(request)
		#@household = Household.find(@interview.household_id)
        #request = RestClient.get 'https://sra-api.herokuapp.com/interviews/household', {:params => {:id => params[:id]}}
        #@household  = JSON.parse(request)
		raise "No such household" unless @household 

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @interview }
		end
	end

	# GET /interviews/new
	# GET /interviews/new.json
	def new
		#@household = Household.find(params[:household_id])
        
		@interview = Interview.new
        
        
		# @interview.health = Health.new
		# @interview.expense = Expense.new
		# @interview.morbidity = Morbidity.new

		@path = [@household, @interview]

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @interview }
		end
	end

	# GET /interviews/1/edit
	def edit
		#@interview = Interview.find(params[:id])
        request = RestClient.get 'https://sra-api.herokuapp.com/interviews/:id', {:params => {:id => params[:id]}}
        @interview = JSON.parse(request)
		#@household = Household.find(@interview.household_id)
		@path = @interview
	end

	# POST /interviews
	# POST /interviews.json
	def create
		#render inline: params.inspect
		#@household = Household.find(params[:household_id])
        
		#@interview = Interview.new(params[:interview])
        RestClient.post 'https://sra-api.herokuapp.com/interviews', {:params {:interview => params[:interview]}}
        request =  RestClient.get 'https://sra-api.herokuapp.com/interviews/:id', {:params => {:id => params[:id]}}
        @interview = JSON.parse(request)
		#@interview.health = Health.new(params[:health])
		#@interview.expense = Expense.new(params[:expense])
		#@interview.morbidity = Morbidity.new(params[:morbidity])
		@interview.household = @household

		@path = [@household, @interview]

		if params[:consumed_foods]
			params[:consumed_foods].each do |key, food|
				@interview.consumed_foods.build(food)
			end
		end

		if params[:stored_foods]
			params[:stored_foods].each do |key, food|
				@interview.stored_foods.build(food)
			end
		end

		if params[:purchased_foods]
			params[:purchased_foods].each do |key, food|
				@interview.purchased_foods.build(food)
			end
		end

		respond_to do |format|
			if @interview.save
				format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
				format.json { render json: @interview, status: :created, location: @interview }
			else
				format.html { render action: "new" }
				format.json { render json: @interview.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /interviews/1
	# PUT /interviews/1.json
	def update
		#@interview = Interview.find(params[:id])
        request = RestClient.get "https://sra-api.herokuapp.com/interviews/#{params[:id]}"
        @interview = JSON.parse(request)
		@interview.consumed_foods = []

		if params[:consumed_foods]
			params[:consumed_foods].each do |key, food|
				#@interview.consumed_foods.build(food)
                RestClient.put "https://sra-api.herokuapp.com/interviews/#{params[:id]}/consumed_foods" {:interview =>{:comsumed_foods => food}
			end
		end

		respond_to do |format|
            if response.status == 200
				format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @interview.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /interviews/1
	# DELETE /interviews/1.json
	def destroy
		#@interview = Interview.find(params[:id])
        RestClient.delete "https://sra-api.herokuapp.com/interviews/#{params[:id]}"
		respond_to do |format|
			format.html { redirect_to household_interviews_path(@household) }
			format.json { head :no_content }
		end
	end
end
