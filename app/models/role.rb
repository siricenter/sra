class Role < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions

  def has_permission permission_name
	  self.permissions.each do |permission|
		  return true if permission.name == permission_name
	  end
	  return false
  end
end
