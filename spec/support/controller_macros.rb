module ControllerMacros
	def login_user
		
		before :each do
			DatabaseCleaner.start
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@current_user = FactoryGirl.create :user
			sign_in @current_user
		end

		after :each do
			DatabaseCleaner.clean
		end
	end

	def login_admin
		before :each do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			admin = FactoryGirl.create(:admin)
			admin_role = FactoryGirl.build(:admin_role)
			if admin_role.valid?
				admin_role.save 
			else
				admin_role = Role.find_by_name :admin
			end

			admin.roles << admin_role
			admin.has_role?(:admin).should == true
			sign_in :user, admin
		end

		after :each do
			DatabaseCleaner.clean
		end
	end
end
