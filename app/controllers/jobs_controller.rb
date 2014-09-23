class JobsController < ApplicationController
	def new
		#@person = Person.find(params[:person_id])
        request = RestClient.get "https://sra-api.com/households/people/#{params[:id]}"
        @person = JSON.parse(request)
		@job = Job.new
        #RestClient.post 'https://sra-api.com/households/people/occupations/jobs'
		#@occupations = Occupation.all
        request = RestClient.get 'https://sra-api.com/households/people/occupations' {:accept => :json}
        @occupations = JSON.parse(request)
		@occupations = @occupations.map do |occupation|
			occupation.name
		end
		@path = [@person, @job]
	end

	def create
		#@person = Person.find(params[:person_id])
        RestClient.post "https://sra-api.com/households/people/#{params[:id]}/jobs" {:job => params[:job]}
		#@job.update_attributes(params[:job].except("occupation")
		if response.status == 200
			redirect_to person_path(@person)
		else
			redirect_to new_person_job_path(@person)
		end
	end

	def show
		#@job = Job.find(params[:id])
        request = RestClient.get "https://sra-api.com/households/people/occupations/jobs/#{params[:id]}"
        @job = JSON.parse(request)
	end

	def index
		#@person = Person.find(params[:person_id])
        request = RestClient.get "https://sra-api.com/households/people/#{params[:person_id]}/jobs"
        @jobs = JSON.parse(request)
	end

	def edit
		#@job = Job.find(params[:id])
        RestClient.put "https://sra-api.com/households/people/jobs/#{params[:id]}/person", {:job => params[:job]}
		@path = @job
	end

	def destroy
        RestClient.delete "https://sra-api.com/households/people/jobs/#{params[:id]}", {:job => @job}}
		#@job.destroy
		redirect_to person_path(@job.person)
	end
end
