class RegistrationsController < Devise::RegistrationsController
	def create
		super do |resource|
			public_role = Role.find_by_name("public")
			resource.roles << public_role
		end
	end
end
