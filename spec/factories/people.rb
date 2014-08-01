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

FactoryGirl.define do
    factory :person do |factory|
		factory.given_name { Faker::Name.first_name }
		factory.family_name { Faker::Name.last_name }
		factory.birthday Time.now
		factory.education_level "some college"
		factory.gender "male"
		factory.in_school true
	end
end
