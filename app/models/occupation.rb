# //@annotation:tour model-active-record-1
# == Schema Information
#
# Table name: occupations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Occupation < SraModel
  json_attributes :id,
		:name
		:created_at,
		:updated_at
		
end
# //@annotation:/tour model-active-record-1