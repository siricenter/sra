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

class ConsumedFood < SraModel
	json_attributes :frequency, :n_id, :servings
	
	def name
		get_data["item_name"]
	end
end
