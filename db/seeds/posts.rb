tag = Tag.create!(name: "LifeSense")
20.times do |n|
  title  = Faker::Lorem.phrase
  content = Faker::Lorem.paragraph

  name = Faker::Color.name
  post = Post.create!(title:  title,
                    content: content,
                     tag: tag)
end
