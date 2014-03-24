class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me
	# attr_accessible :title, :body
	has_and_belongs_to_many :roles

	def has_role role_name
		self.roles.each do |role|
			return true if role.name == role_name
		end

		return false
	end

	def has_permission permission_name
		self.roles.each do |role|
			return true if role.has_permission(permission_name)
		end
		return false
	end
end
