class Interview < InterviewDSL
	include Mongoid::Document
    embeds_many :consumed_foods
	embeds_many :stored_foods
	embeds_many :purchased_foods
	define_nutrients :calories, :sugars_grams, :sodium_grams, :fat_grams, :protein_grams, :cholesterol_grams, :vitamin_a_dv, :vitamin_c_dv
end
