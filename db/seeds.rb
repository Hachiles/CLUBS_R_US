# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
require "open-uri"

club_names = [
  "Anomalie Art Club",
  "Loophole",
  "KitKat",
  "OHM",
  "Tresor",
  "Watergate",
  "Kater Blau",
  "Berghain",
  "://about blank",
  "Sisyphos",
  "SchwuZ"
]

club_addresses = [
  "Storkower Str. 123, Berlin",
  "Boddinstraße 60, Berlin",
  "Köpenicker Str. 76, Berlin",
  "Köpenicker Str. 70, Berlin",
  "Köpenicker Str. 64, Berlin",
  "Falckensteinstraße 49, Berlin",
  "Holzmarktstraße 25, Berlin",
  "Am Wriezener Bahnhof, Berlin",
  "Markgrafendamm 24c, Berlin",
  "Hauptstraße 15, Berlin",
  "Rollbergstraße 26, Berlin"
]

club_descriptions = [
  "Come for the clubbing, and stay for the art: Anomalie Art Club is home to some of the most spectacular visual design on Berlin’s club scene. This place has played host to techno DJs and artists from around the world.",
  "Decadent and trashy in equal measures, this ruin-esque former brothel attracts both glitter punks and health goths, who sway to experimental electronic music, down cheap beers and soak up the laid-back vibes.",
  "This legendary sex and techno club for all is a labyrinthine complex of half a dozen dancefloors, a dubious swimming pool and a grimy mock-operating room. Saturday nights feature the club’s flagship CarneBall Bizarre, with an after-hours event that runs through Sunday.",
  "Bordered by KitKat Club, Tresor and Kraftwerk, OHM holds a highly sought-after spot on the frontier between Kreuzberg and Mitte. It’s a relatively new club, but one that carved out its niche in record time: the pint-sized venue is home to experimental electronic music.",
  "Berlin’s original techno club is housed in what was formerly the main central-heating power station for East Berlin. The colossal location is breathtaking, but only a tiny portion of the vast space is in use",
  "This slick two-floor club was a driving force behind the rise of minimal techno in mid-2000s Berlin, as well as the first to invest in a ceiling-mounted responsive LED lighting system, now copied all around the world.",
  "This is the X-rated part of the expansive, family-friendly Holzmarkt development. With a moored boat, a roaring fire at night and many hammock-like features, the potential for alfresco relaxing is high.",
  "Easily the city’s most famous club and arguably the best club in the world, Berghain is not just a techno club: it’s a way of life for many of the tireless regulars who call it ‘church’.",
  "Particularly famed for its open-air parties, this club near Ostkreuz station is a favourite with the city’s more adventurous hedonists – not least for its monthly blowout Buttons (formerly Homopatik).",
  "You don’t make the trek out to Sisyphos just for a snoop and a couple of beers. It’s an ‘in for a penny, in for a pound’ sort of place, where the party begins on Friday and trundles on non-stop until Monday.",
  "One of Berlin’s longest-running dance institutions. A variety of mainstream and more underground events take place throughout the week, attracting a mixed and ready-to-mingle crowd"
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
puts " "

  11.times do
    file = URI.open('https://source.unsplash.com/1600x900/?club')

    club = Club.new(
      name: club_names[index_num],
      capacity: rand(200..500),
      hourly_price: rand(500..1000), 
      address: club_addresses[index_num],
      description: club_descriptions[index_num],
      )

    club.photo.attach(io: file, filename: 'club.png', content_type: 'image/png')
    club.user = User.first
    club.save
    index_num = index_num += 1
    puts " "
    puts "#{Club.count}"
  end

puts " "
puts "Seeding process completed!"
puts "The user account of #{User.first.username} was used to generate #{Club.count} Clubs"
