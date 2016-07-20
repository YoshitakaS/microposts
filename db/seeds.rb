# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "example",
             email: "example@railstutoriall.org",
             area: "mito",
             age: "25",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  area = "mito"
  age = "25"
  password = "password"
  User.create!(name:  name,
               email: email,
               area: area,
               age: age,
               password:              password,
               password_confirmation: password)
end