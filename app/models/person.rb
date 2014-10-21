# == Schema Information
#
# Table name: people
#
#  id                     :integer          not null, primary key
#  given_name             :string(255)
#  family_name            :string(255)
#  family_relationship_id :integer
#  birthday               :date
#  education_level        :string(255)
#  gender                 :string(255)
#  in_school              :boolean
#  is_alive               :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  household_id           :integer
#

class Person < SraModel
	json_attributes :id,
		:given_name,
		:family_name,
		:family_relationship_id,
		:birthday,
		:education_level,
		:gender,
		:in_school,
		:is_alive,
		:created_at,
		:updated_at,
		:household_id
end
