# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < SraModel
  json_attributes :id,
		:name,
		:description,
		:created_at,
		:updated_at

end
