# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = [
  Rails.root + 'app/assets/images/profile_images/connie.jpg',
  Rails.root + 'app/assets/images/profile_images/lexi_lore.jpeg'
]

password = 'pass12345'
1.upto(5) do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image: File.open(images[rand(0..1)]),
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password,
    gender: %w[male female].sample
  )
end
