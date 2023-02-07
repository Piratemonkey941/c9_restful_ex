# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'

30.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 6),
    body: Faker::Lorem.paragraph(sentence_count: 8)
  )
end

post_ids = Post.pluck(:id)

100.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    post_id: post_ids.sample
  )
end