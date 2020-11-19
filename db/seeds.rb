# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
require "open-uri"

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

puts "Deleting current bookings (#{Booking.count} bookings to delete)"
Booking.delete_all
puts "All bookings deleted"
puts " "

puts "Deleting current clubs (#{Club.count} clubs to delete)"
Club.delete_all
puts "All clubs deleted"
puts " "

puts "Beginning the seeding process"
puts "Seeding, please wait..."

  10.times do
    file = URI.open('https://source.unsplash.com/1600x900/?club')

    club = Club.new(
      name: Faker::Game.title,
      capacity: rand(50..2000),
      hourly_price: rand(50..200), 
      address: real_addresses[index_num],
      description: Faker::Lorem.paragraph_by_chars,
      )

    club.photo.attach(io: file, filename: 'club.png', content_type: 'image/png')
    club.user = User.first
    club.save
    index_num = index_num += 1 
  end

puts " "
puts "Seeding process completed!"
puts "The user account of #{User.first.username} was used to generate #{Club.count} Clubs"
