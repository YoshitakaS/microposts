# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Yoshitaka",
             email: "yoshitakasuzuki.7.3@gmail.com",
             area: "Mito",
             age: "25",
             password:              "55832511955",
             password_confirmation: "55832511955",
             admin: true)


