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

FactoryGirl.define do
	factory :household do |factory|
		factory.name { Faker::Name.last_name }
		user
	end
end
