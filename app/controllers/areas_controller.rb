require 'rest_client'
class AreasController < ApplicationController
	before_filter :authenticate_user!
  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
     
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
   
    #@area = Area.find(params[:id])
    @roles = Role.all
    @roles = RestClient.get 'http://sra-api.com/roles' {:accept => :json}
    @roles = JSON.parse(@roles)  
    @users = User.joins(:roles).where(roles: {name: ["Field Worker", "Manager"]})
    #roles = Role.where(:name ["Field Worker", "Manager"])
    #users = User.where(name: "Field Worker")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.json
  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { render action: "new" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to areas_url }
      format.json { head :no_content }
    end
  end
end
