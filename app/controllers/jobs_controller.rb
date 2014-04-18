class JobsController < ApplicationController
	def new
		@person = Person.find(params[:person_id])
		@job = Job.new
		@occupations = Occupation.all
		@occupations = @occupations.map do |occupation|
			occupation.name
		end
		@path = [@person, @job]
	end

	def create
		@person = Person.find(params[:person_id])
		@job = @person.jobs.build()
		@job.update_attributes(params[:job].except("occupation"))
		@job.occupation = Occupation.find_by_name(params[:job][:occupation])

		

		if @job.save!
			redirect_to person_path(@person)
		else
			redirect_to new_person_job_path(@person)
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
		@person = @job.person
		@path = @job
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to person_path(@job.person)
	end
end
