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
end
