# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < SraModel
  json_attributes :id,
		:name,
		:created_at,
		:updated_at
		
end
