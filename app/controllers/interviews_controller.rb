class InterviewsController < ApplicationController
	# GET /interviews
	# GET /interviews.json
	def index
		@interviews = Interview.all
		@household = Household.find(params[:household_id])

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @interviews }
		end
	end

	# GET /interviews/1
	# GET /interviews/1.json
	def show
		@interview = Interview.find(params[:id])

		render inline: @interview.to_json
		#@household = Household.find(@interview.household_id)

		#respond_to do |format|
		#	format.html # show.html.erb
		#	format.json { render json: @interview }
		#end
	end

	# GET /interviews/new
	# GET /interviews/new.json
	def new
		@household = Household.find(params[:household_id])
		@interview = Interview.new
		@interview.health = Health.new
		@interview.expense = Expense.new
		@interview.morbidity = Morbidity.new

		@path = [@household, @interview]

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @interview }
		end
	end

	# GET /interviews/1/edit
	def edit
		@interview = Interview.find(params[:id])
		@household = Household.find(@interview.household_id)
		@path = @interview
	end

	# POST /interviews
	# POST /interviews.json
	def create
		render inline: params.inspect
		#@household = Household.find(params[:household_id])

		#@interview = Interview.new(params[:interview])
		#@interview.health = Health.new(params[:health])
		#@interview.expense = Expense.new(params[:expense])
		#@interview.morbidity = Morbidity.new(params[:morbidity])
		#@interview.household_id = params[:household_id]

		#@path = [@household, @interview]

		#if params[:consumed_foods]
		#	params[:consumed_foods].each do |key, food|
		#		@interview.consumed_foods.build(food)
		#	end
		#end

		#if params[:stored_foods]
		#	params[:stored_foods].each do |key, food|
		#		@interview.stored_foods.build(food)
		#	end
		#end

		#if params[:purchased_foods]
		#	params[:purchased_foods].each do |key, food|
		#		@interview.purchased_foods.build(food)
		#	end
		#end

		#respond_to do |format|
		#	if @interview.save
		#		format.html { redirect_to new_event_path, notice: 'Interview was successfully create.' }
		#		format.json { render json: @interview, status: :created, location: @interview }
		#	else
		#		format.html { render action: "new" }
		#		format.json { render json: @interview.errors, status: :unprocessable_entity }
		#	end
		#end
	end

	# PUT /interviews/1
	# PUT /interviews/1.json
	def update
		@interview = Interview.find(params[:id])

		respond_to do |format|
			if @interview.update_attributes(params[:interview])
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
		@interview = Interview.find(params[:id])
		@household = Household.first
		@interview.destroy

		respond_to do |format|
			format.html { redirect_to household_interviews_path(@household) }
			format.json { head :no_content }
		end
	end
end
