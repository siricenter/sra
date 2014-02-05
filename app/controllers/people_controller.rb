class PeopleController < ApplicationController
  def new
	  @person = Person.new
	  @edu_options = ['None', 'Some Elementary', 'Elementary', 'Some Secondary', 'Secondary', 'Some College', 'College']
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end
end
