class CreatePermissionsRoles < ActiveRecord::Migration
	def up
		create_table :permissions_roles do |t|
			t.references :permission
			t.references :role
		end
	end

	def down
	end
end
