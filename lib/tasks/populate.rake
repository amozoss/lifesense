
namespace :db do
  task populate: :environment do

    User.destroy_all

    20.times do
      User.create(
        name: Faker::Name.first_name,
        email: Faker::Internet.email
      )
    end
  end
end
