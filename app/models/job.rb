# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  seasonal      :boolean
#  description   :string(255)
#  person_id     :integer
#  occupation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Job < SraModel
	json_attributes :id,
		:title,
		:seasonal,
		:description,
		:person_id,
		:occupation_id,
		:created_at,
		:updated_at
		
end
