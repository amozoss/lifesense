# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name:  "dan",
             email: "dan@dan.com",
             password:              "dandan",
             password_confirmation: "dandan", 
             token: User.new_token)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  token = User.new_token
  User.create!(name:  name,
               email: email,
               token: token,
               password:              password,
               password_confirmation: password)
end
