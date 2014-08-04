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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :consumed_food do
    interview nil
    n_id "MyString"
    servings 1
    frequency "MyString"
  end
end
