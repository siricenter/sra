# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  start      :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
factory :event do |factory|
		factory.title 'My big party'
		factory.start {Time.now}
		factory.user {User.last}
	end
end
