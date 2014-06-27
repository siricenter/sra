class ConsumedFood
	include Mongoid::Document
	embedded_in :interview

	field :nutritionix_id, type: String
	field :servings, type: Integer
	field :frequency, type: String

	validates :nutritionix_id, presence: true
	validates :servings, presence: true, numericality: {greater_than: 0}
	validates :frequency, inclusion: {in: %w{daily weekly monthly}}

	def calories
		get_data
		@data["nf_calories"]
	end

	def is_cached
		!(@data.nil?)
	end

	def get_data
		unless is_cached
			app_id = "f67bfd42"
			app_key = "c69bd76b98dd8d4e1fd629241b3bb199"
			json = Nutritionix::API.new(app_id, app_key, "http://api.nutritionix.com/v1/").get_item(self.nutritionix_id)
			@data = JSON.parse(json)
		end
	end
end
