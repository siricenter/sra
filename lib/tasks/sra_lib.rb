require 'pluralizer'
module SraLib

	def self.login user
		api_response = RestClient.post "#{api_url}/sessions", params: user

		if token_hash.include?('token')
			session[:token] = token_hash['token']
			return :success
		end

		return :failure
	end

	# http://url.com/
	def self.api_url
		"http://brainery-api.herokuapp.com"
	end

	# http://url.com/resources
	def self.base_url object
		resource = object.class.name.downcase
		return "#{api_url}/#{Pluralizer.new.pluralize(2, resource).delete('2 ')}"
	end

	#http://url.com/resources
	#http://url.com/resources/id
	def self.resource_url object
		if object.id
			"#{base_url object}/#{object.id}"
		else
			base_url object
		end
	end

	def self.get url
		RestClient.get url
	end

	def self.post url, data = {}
		RestClient.post url, params: data
	end

	def self.delete url
		RestClient.delete url
	end

	def self.put url, data = {}
		RestClient.put url, params: data
	end
end

