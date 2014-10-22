# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  start      :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < SraModel
	json_attributes :id,
		:title,
		:start,
		:user_id,
		:created_at,
		:updated_at
	
end
