# == Schema Information
#
# Table name: family_relationships
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
factory :family_relationship do |factory|
		factory.name "father"
	end
    end
