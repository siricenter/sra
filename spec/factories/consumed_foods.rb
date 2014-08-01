# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :consumed_food do
    interview nil
    n_id "MyString"
    servings 1
    frequency "MyString"
  end
end
