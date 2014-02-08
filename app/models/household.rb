class Household < ActiveRecord::Base
  attr_accessible :name
  has_many :people
  
  accepts_nested_attributes_for :people
end
