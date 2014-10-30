class ApplicationController < ActionController::Base
	protect_from_forgery

	
	def check_login
		redirect_to root_path unless session[:token]
	end
	
end
