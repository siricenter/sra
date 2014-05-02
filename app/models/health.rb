class Health
	include Mongoid::Document
	embedded_in :interview
	field :bathroom_type, type: String
	field :garbage_disposal, type: String
	field :separate_kitchen, type: Boolean
	field :sewage_disposal, type: String
	field :water_source, type: String
	field :water_chlorinated, type: Boolean

	validates :bathroom_type, presence: true
	validates :garbage_disposal, presence: true
	validates :separate_kitchen, presence: true
	validates :sewage_disposal, 
		presence: true,
		inclusion: { in: %w{outhouse open field bog septic tank sewer} }
	validates :water_source, presence: true
	validates :water_chlorinated, presence: true
end
