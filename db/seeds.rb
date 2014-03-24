# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: "public")
admin_role = Role.create(name: "admin")
admin = User.new({email: "admin@admin.com", password: "abc123456", password_confirmation: "abc123456"})
admin.roles << admin_role
admin.save

Permission.create([
	{name: "Create Household"}, 
	{name: "Edit Household"}])

Role.create([
	{name: "Field Worker"}
])

field_worker = Role.find_by_name("Field Worker")
field_worker.permissions << Permission.find_by_name("Create Household")
field_worker.permissions << Permission.find_by_name("Edit Household")
