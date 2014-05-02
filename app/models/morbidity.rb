class Morbidity
	include Mongoid::Document
	embedded_in :interview

	field :child_sickness_frequency, type: Integer
	field :child_sickness_time, type: String
	field :child_aid, type: String
	field :child_common_ailment, type: String

	field :adult_sickness_frequency, type: Integer
	field :adult_sickness_time, type: String
	field :adult_aid, type: String
	field :adult_common_ailment, type: String

	validates :child_sickness_frequency, presence: true
	validates :child_sickness_time, presence: true
	validates :child_aid, presence: true
	validates :child_common_ailment, presence: true

	validates :adult_sickness_frequency, presence: true
	validates :adult_sickness_time, presence: true
	validates :adult_aid, presence: true
	validates :adult_common_ailment, presence: true
end
