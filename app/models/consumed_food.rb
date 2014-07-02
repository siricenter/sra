class ConsumedFood < ConsumedFoodDSL
	include Mongoid::Document
	nutrients calories: "nf_calories", sugars_grams: "nf_sugars", fat_grams: "nf_total_fat", sodium_grams: "nf_sodium", protein_grams: "nf_protein", cholesterol_grams: "nf_cholesterol"

	embedded_in :interview

	field :n_id, type: String
	field :servings, type: Integer
	field :frequency, type: String

	validates :n_id, presence: true
	validates :servings, presence: true, numericality: {greater_than: 0}
	validates :frequency, inclusion: {in: %w{daily weekly monthly}}
	
end
