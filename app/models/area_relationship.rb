# == Schema Information
#
# Table name: area_relationships
#
#  id           :integer          not null, primary key
#  area_id      :integer
#  user_id      :integer
#  relationship :string(255)
#

class AreaRelationship < SraModel
    json_attributes :id,
	:area_id,
	:user_id,
	:relationship
end
