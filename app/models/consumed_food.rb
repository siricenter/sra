# == Schema Information
#
# Table name: consumed_foods
#
#  id           :integer          not null, primary key
#  interview_id :integer
#  n_id         :string(255)
#  servings     :integer
#  frequency    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_consumed_foods_on_interview_id  (interview_id)
#

class ConsumedFood
	attr_accessible :frequency, :n_id, :servings
	def initialize json = {}
		json = json['area'] if json.include?('area')
		@id = json['id'] if json.include?('id')
		@interview_id = json['interview_id'] if json.include?('interview_id')
		@n_id = json['n_id'] if json.include?('n_id')
		@servings = json['servings'] if json.include?('servings')
		@frequency = json['frequency'] if json.include?('frequency')
		@created_at = json['created_at'] if json.include?('created_at')
		@updated_at = json['updated_at'] if json.include?('updated_at')
		
	end
	
	def name
		get_data["item_name"]
	end
end
