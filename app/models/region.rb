# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Region < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :areas
end
