# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Household < ActiveRecord::Base
  attr_accessible :name
  has_many :people

  accepts_nested_attributes_for :people
end
