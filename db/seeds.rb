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
