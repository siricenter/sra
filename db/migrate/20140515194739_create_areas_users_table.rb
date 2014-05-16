class CreateAreasUsersTable < ActiveRecord::Migration
  def change
	  create_table :users_areas do |t|
		  t.references :areas
		  t.references :users
	  end
  end
end
