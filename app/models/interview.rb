class Interview < InterviewDSL
	include Mongoid::Document
	field :household_id, type: Integer
    embeds_many :consumed_foods

	define_nutrients :calories, :sugars_grams, :sodium_grams, :fat_grams, :protein_grams, :cholesterol_grams, :vitamin_a_dv, :vitamin_c_dv

	validates_presence_of :consumed_foods
end
