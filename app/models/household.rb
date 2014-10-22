# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Household < SraModel
	json_attributes :id,
	:name,
	:created_at
	:updated_at
	:user_id
    
end
