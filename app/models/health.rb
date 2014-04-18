class Health
	include Mongoid::Document
	embedded_in :interview
	field :bathroom_type, type: String
	field :garbage_disposal, type: String
	field :separate_kitchen, type: Boolean
	field :sewage_disposal, type: String
	field :water_source, type: String
	field :water_chlorinated, type: Boolean
end
