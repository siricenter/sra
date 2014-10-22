# == Schema Information
#
# Table name: roles_users
#
#  id      :integer          not null, primary key
#  role_id :integer
#  user_id :integer
#

class RolesUsers < SraModel
   json_attributes :id,
		:role_id
		:user_id
end
