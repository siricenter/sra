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

FactoryGirl.define do
	factory :job do |factory|
		factory.person {FactoryGirl.build :person}
		factory.occupation {FactoryGirl.build :occupation}
	end
end
