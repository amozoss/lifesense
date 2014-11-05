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
             admin: true,
             token: User.new_token)

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@lifesense.com"
  password = "password"
  token = User.new_token
  User.create!(name:  name,
               email: email,
               token: token,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
5.times do
    users.each do |user|
      name = Faker::Company.name
      token = Transmitter.new_token
      user.transmitters.create!(name: name, transmitter_token: token)
    end
end

5.times do
    users.each do |user|
      name = Faker::Color.name
      pin = rand(9)
			formula = Faker::Education.degree
      user.sensors.create!(name: name, pin: pin, formula: formula)
    end
end
