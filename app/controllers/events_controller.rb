class EventsController < ApplicationController
	before_filter :authenticate_user!
	# GET /events
	# GET /events.json
	def index
		#@events = current_user.events
        request = RestClient.get 'https://sra-api.com/users/:id/events', {:params => {:id => params[:user_id]}}
        @events = JSON.parse(requests)
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @events }
		end
	end

	# GET /events/1
	# GET /events/1.json
	def show
		#@event = Event.find(params[:id])
        request = RestClient.get 'https://sra-api.com/users/events/:id', {:params => {:id => params[:id]}} 
        @event = JSON.parse(request)
		unless @event.user == current_user
			raise CanCan::AccessDenied
		end

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @event }
		end
	end

	# GET /events/new
	# GET /events/new.json
	def new
		@event = Event.new
        RestClient.post 'https://sra-api.com/users/events'
        request = RestClient.get 'https://sra-api.com/users/events/last'
        @event = JSON.parse(json)
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @event }
		end
	end

	# GET /events/1/edit
	def edit
		#@event = Event.find(params[:id])
        request = RestClient.get 'https://sra-api.com/users/events/:id', {:params => {:id => params[:id]}} 
        @event = JSON.parse(request)
	end

	# POST /events
	# POST /events.json
	def create
		#user = current_user
        request = RestClient.get 'https//sra-api.com/users/current' {:accept => :json}
        user = JSON.parse(request)
		#@event = Event.new(params[:event])
        request = RestClient.get 'https://sra-api.com/users/events/:event', {:params => {:event => params[:event]}} 
        @event = JSON.parse(request)
		user.events << @event
        RestClient.put 'https://sra-api.com/users/current'
        request = RestClient.get 'https//sra-api.com/users/current' {:accept => :json}
        user = JSON.parse(request)
		respond_to do |format|
			if user
				format.html { redirect_to :dashboard}
				format.json { render json: @event, status: :created, location: @event }
			else
				format.html { render action: "new" }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /events/1
	# PUT /events/1.json
	def update
		#@event = Event.find(params[:id])
        request = RestClient.get 'https://sra-api.com/users/events/:id', {:params => {:id => params[:id]}} 
        @event = JSON.parse(request)
		respond_to do |format|
			if @event.update_attributes(params[:event])
				format.html { redirect_to @event, notice: 'Event was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /events/1
	# DELETE /events/1.json
	def destroy
		#@event = Event.find(params[:id])
        RestClient.delete 'https://sra-api.com/users/events/:id', {:params => {:id => params[:id]}}
		#@event.destroy

		respond_to do |format|
			format.html { redirect_to events_url }
			format.json { head :no_content }
		end
	end
end
