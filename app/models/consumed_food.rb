class ConsumedFood
	include Mongoid::Document
	embedded_in :interview

	field :n_id, type: String
	field :servings, type: Integer
	field :frequency, type: String

	validates :n_id, presence: true
	validates :servings, presence: true, numericality: {greater_than: 0}
	validates :frequency, inclusion: {in: %w{daily weekly monthly}}

	def calories
		get_data["nf_calories"]
	end

	def sugars_grams
		get_data["nf_sugars"]
	end

	def fat_grams
		get_data["nf_total_fat"]
	end

	def sodium_grams
		get_data["nf_sodium"]
	end

	def is_cached
		!(@data.nil?)
	end

	def get_data
		unless is_cached
			app_id = "f67bfd42"
			app_key = "c69bd76b98dd8d4e1fd629241b3bb199"
			json = Nutritionix::API.new(app_id, app_key, "https://api.nutritionix.com/v1/").get_item(self.n_id)
			@data = JSON.parse(json)
		end
		return @data
	end
end
