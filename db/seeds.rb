#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[:second, :minute, :hour, :day, :week, :month].each do |period|
    FrequencyPeriod.create(name: period)
end

User.create!(name:  "dan",
             email: "dan@dan.com",
             password:              "dandan",
             password_confirmation: "dandan", 
             admin: true,
             token: User.new_token)

User.create!(name:  "zach",
             email: "zach.toolson@gmail.com",
             password: "zach",
             password_confirmation: "zach",
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
      trans = user.transmitters.create!(name: name, transmitter_token: token)
      [:A0, :A1, :A2, :A4, :A5, :A6, :A7, :PF_1, :PF_2, :PF_3, :PB_3, :PC_4, :PC_5, :PC_6, :PC_7, :PD_6, :PD_7, :PF_4].each do |pin|
        trans.pin_numbers.create!(name: pin)
      end
    end
end

5.times do
    users.each do |user|
      name = Faker::Color.name
      formula = Faker::Education.degree
      lower_bound = rand(3000)
      user.sensors.create!(name: name, formula: formula, lower: lower_bound)
    end
end

day = 1
5.times do
    users.each do |user|
      user.sensors.each do |sensor|
        value = rand(3000)
        time_stamp = day.days.ago.to_i * 1000
        sensor.records.create!(time_stamp: time_stamp, value:value)
        day += 1
      end
    end
end
