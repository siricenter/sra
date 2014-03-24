class Permission < ActiveRecord::Base
  attr_accessible :name
  validates :name, uniqueness: true, presence: true

  has_and_belongs_to_many :roles
end
