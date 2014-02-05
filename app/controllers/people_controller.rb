class PeopleController < ApplicationController
	def new
		@person = Person.new
	end

	def create
		@person = Person.new(params[:person])

		respond_to do |format|
			if @person.save
				format.html {redirect_to @person }
			else
				format.html {render action: :new }
			end
		end
	end

	def edit
		@person = Person.find(params[:id])
	end

	def update
		@person = Person.new(params[:person])
		
		respond_to do |format|
			if @person.update_attributes(params[:thing])
				format.html {render action: 'show'}
			end
		end
	end

	def index
		@people = Person.all
	end

	def show
		@person = Person.find(params[:id])
	end

	def destroy
		@person = Person.find(params[:id])

		if @person.destroy
			redirect_to people_path
		end
	end
end
