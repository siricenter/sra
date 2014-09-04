class JobsController < ApplicationController
	def new
		#@person = Person.find(params[:person_id])
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:person_id]}}
        @person = JSON.parse(request)
		#@job = Job.new
        RestClient.post 'https://sra-api.com/households/people/occupations/jobs'
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
        request = RestClient.get 'https://sra-api.com/households/people/:id' {:params => {:id => params[:person_id]}}
        @person = JSON.parse(@person)
		@job = @person.jobs.build()
        RestClient.post 'https://sra-api.com/households/people/:id/jobs' {:params => {:id => params[:person_id]}}
        RestClient.put 'https://sra-api.com/households/people/:id/jobs' {:params => {:job => params[:job]}}
		#@job.update_attributes(params[:job].except("occupation"))
		@job.occupation = Occupation.find_by_name(params[:job][:occupation])
        request = RestClient.get 'https://sra-api.com/households/people/occupations/:name' {:params => {:occupation => params[:job][:occupation]}}
        occupation = JSON.parse(request)
        @job.occupation = occupation
        request = RestClient.get 'https://sra-api.com/households/people/occupations/jobs/last'
        @job = JSON.parse(request)
		if @job.save!
			redirect_to person_path(@person)
		else
			redirect_to new_person_job_path(@person)
		end
	end

	def show
		#@job = Job.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/occupations/jobs/:id',{:params => {:id => params[:id]}}
        @job = JSON.parse(request)
	end

	def index
		#@person = Person.find(params[:person_id])
        request = RestClient.get 'https://sra-api.com/households/people/:id',{:params => {:id => params[:person_id]}}
        @person = JSON.parse(request)
        request = RestClient.get 'https://sra-api.com/households/people/:id/jobs',{:params => {:id => params[:person_id]}}
        @jobs = JSON.parse(request)
	end

	def edit
		#@job = Job.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/jobs/:id',{:params => {:id => params[:person_id]}}
        @jobs = JSON.parse(request)   
		@person = @job.person
        request = RestClient.get 'https://sra-api.com/households/people/jobs/:id/person',{:params => {:id => params[:id]}}
        @jobs = JSON.parse(request)
		@path = @job
	end

	def destroy
		#@job = Job.find(params[:id])
        request = RestClient.get 'https://sra-api.com/households/people/jobs/:id',{:params => {:id => params[:person_id]}}
        @job = JSON.parse(request)  
        RestClient.delete 'https://sra-api.com/households/people/jobs/:id',{:params => {:job => @job}}
		#@job.destroy
		redirect_to person_path(@job.person)
	end
end
