require 'rest_client'
require 'sra_lib'
class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user: params[:user])
		@user = User.login(@user)
		
		if @user.code == 404 
			redirect_to :new_user_session_path
		end
		
		respond_to do |format|
			if SraLib::login == :success
			format.html { redirect_to "users/dashboard", notice: 'Session was successfully created.' }
			format.json { render json: @user, status: :created, location: @area }
			else
			format.html { render action: "new" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
end