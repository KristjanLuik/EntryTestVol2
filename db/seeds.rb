# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create roles
Role.create([
	{name: "user", access: 0},
	{name: "administrator", access: 1}, 
	{name: "manager", access: 2}, 
	{name:"admin", access: 3}
])

