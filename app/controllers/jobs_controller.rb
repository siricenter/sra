class JobsController < ApplicationController
	def new
		@person = Person.find(params[:person_id])
		@job = Job.new
		RestClient.post 'https://sra-api.herokuapp.com/households/people/occupations/jobs'
		@occupations = Occupation.all
		@occupations = @occupations.map do |occupation|
			occupation.name
		end
		@path = [@person, @job]
	end

	def create
		@person = Person.find(params[:person_id])
		RestClient.post "https://sra-api.herokuapp.com/households/people/#{params[:id]}/jobs", {:job => params[:job]}
		#@job.update_attributes(params[:job].except("occupation")
		#	if @person.status == 200
		#   redirect_to person_path(@person)
		#	else
		#	redirect_to new_person_job_path(@person)
		#end
	end

	def show
		@job = Job.find(params[:id])
	end

	def index
		@person = Person.find(params[:person_id])
	end

	def edit
		@job = Job.find(params[:id])
		@path = @job
	end

	def destroy
		#RestClient.delete "https://sra-api.herokuapp.com/households/people/jobs/#{params[:id]}", {:job => @job}
		@job.delete
		redirect_to person_path(@job.person)
	end
end
