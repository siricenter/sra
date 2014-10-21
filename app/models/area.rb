# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area
	attr_accessor :id, :name, :created_at, :updated_at

	def initialize json = {}
		json = json['area'] if json.include?('area')

		@id = json['id'] if json.include?('id')
		@name = json['name'] if json.include?('name')
		@created_at = json['created_at'] if json.include?('created_at')
		@updated_at = json['updated_at'] if json.include?('updated_at')
	end
end
