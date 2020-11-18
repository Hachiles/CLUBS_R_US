# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

# seed_user = User.create(username: "seeder", email: "seeder@gmail.com", first_name: "seeder", last_name: "Mcseeder", password: "seed")

real_addresses = [
  "Rudi-Dutschke-Straße 26, Berlin",
  "Lindenstraße 9-14, Berlin",
  "Potsdamer Platz 3, Berlin",
  "Ritterstraße 26, Berlin",
  "Yorckstraße 2, Berlin",
  "Tucholskystraße 32, Berlin",
  "Fasanenstraße 81, Berlin",
  "Köpenicker Str. 76, Berlin",
  "Karl-Marx-Allee 34, Berlin",
  "Brunnenstraße 198, Berlin"
]


index_num = 0


puts "Starting seed"


  6.times do
    file = URI.open('https://source.unsplash.com/1600x900/?club')

    index_num = index_num += 1 
    # puts "Generating faker seed!" 
    # puts index_num
    club = Club.new(
        name: Faker::Game.title,
        capacity: rand(50..2000),
        hourly_price: rand(50..200), 
        address: real_addresses[index_num],
        description: Faker::Lorem.paragraph_by_chars,
    )
    club.photo.attach(io: file, filename: 'club.png', content_type: 'image/png')
    # had to modify this for heroku push
    club.user = User.find(1)
    club.save
  end
  
puts 'Done!'