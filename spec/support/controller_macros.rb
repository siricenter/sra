module ControllerMacros
	def login_user
		before :each do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryGirl.create :user
			#user.confirm!
			sign_in user
		end
	end

	def login_admin
		before :each do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			admin = User.find_by_email("admin@admin.com")
			admin.roles << Role.find_by_name("admin")
			sign_in admin
		end
	end
end
