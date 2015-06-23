# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(firstname: 'John', lastname: 'Wilson', email: 'xxx@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Frank', lastname: 'Boy', email: 'x123xx@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Brian', lastname: 'Li', email: '1234@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Chris', lastname: 'Wong', email: '2345@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Karjen', lastname: 'Game', email: '2345@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Cathy', lastname: 'Wong', email: '2345@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Robert', lastname: 'Tran', email: '2345@gmail.com', password: '777777', password_confirmation: '777777', admin: "false")

User.create(firstname: 'Brian', lastname: 'Li', email: 'brian.kasing.li@gmail.com', password: '419222', password_confirmation: '419222', admin: "true")

