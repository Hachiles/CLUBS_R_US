# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

  20.times do
    club = Club.new(
        name: Faker::Game.title,
        capacity: rand(50..2000),
        hourly_price: rand(50..200),
        address: Faker::Address.full_address,
        description: Faker::Lorem.paragraph_by_chars
        # image: Faker::LoremFlickr.image(size: '50x60', search_terms: ['clubs', 'venue']),
    )
    user = User.where(username: "Hachiles").first
    club.user = user
    club.save
  end
  
puts 'Done!'