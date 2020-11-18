# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

  20.times do
    file = URI.open('https://source.unsplash.com/1600x900/?club')
    club = Club.new(
        name: Faker::Game.title,
        capacity: rand(50..2000),
        hourly_price: rand(50..200),
        address: Faker::Address.full_address,
        description: Faker::Lorem.paragraph_by_chars,
    )
    club.photo.attach(io: file, filename: 'club.png', content_type: 'image/png')
    user = User.where(username: "sdfsdf").first
    club.user = user
    club.save
  end
  
puts 'Done!'
