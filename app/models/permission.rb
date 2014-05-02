# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  attr_accessible :name
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :roles
end
