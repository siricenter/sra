# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < SraModel
	json_attributes :id,
		:name,
		:created_at,
		:updated_at
	end
end
