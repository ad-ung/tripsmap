# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "yaml"
require 'faker'

puts "Destroy favorites"
Favorite.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('favorites')

puts "Destroy blocks"
Block.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('blocks')

puts "Destroy steps"
Step.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('steps')

puts "Destroy trips"
Trip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('trips')

puts "Destroy followers"
Follower.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('followers')

puts "Destroy users"
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts "Creation user"

def create_user(email, pseudo, password, avatar_path)
  u = User.new(email:email, pseudo: pseudo, password: password)
  file = URI.open(avatar_path)
  u.avatar.attach(io: file, filename: "avatar#{User.count + 1}.extension", content_type: "image/png")
  u.save!
end

create_user("johndoe@gmail.com", "Alexandre", "topsecret", "https://res.cloudinary.com/datbhgbcq/image/upload/v1591267983/avatar_sx4zw0.jpg")
create_user("janedoe@gmail.com", "Adeline", "topsecret", "https://res.cloudinary.com/dgsutja6q/image/upload/v1594752028/P1170915_tx7cpm.jpg")
create_user("jean-mi@gmail.com", "Jean-Mi", "topsecret", "https://res.cloudinary.com/dgsutja6q/image/upload/v1594752040/nicolas-horn-MTZTGvDsHFY-unsplash_ia6ohd.jpg")

followers_photos_path = [
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926055/TRIPSMAP/followers_picture/gabriel-silverio-u3WmDyKGsrY-unsplash_afwr8n.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/albert-dera-ILip77SbmOE-unsplash_sj8ca3.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/stefan-stefancik-QXevDflbl8A-unsplash_bhzeac.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/jurica-koletic-7YVZYZeITc8-unsplash_jcyjcs.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/michael-dam-mEZ3PoFGs_k-unsplash_t2ltfq.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926053/TRIPSMAP/followers_picture/sam-burriss-8wbxjJBrl3k-unsplash_xsbuym.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/jimmy-fermin-bqe0J0b26RQ-unsplash_i58llw.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926054/TRIPSMAP/followers_picture/jimmy-fermin-bqe0J0b26RQ-unsplash_i58llw.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926053/TRIPSMAP/followers_picture/austin-wade-X6Uj51n5CE8-unsplash_ipzerr.jpg',
  'https://res.cloudinary.com/datbhgbcq/image/upload/v1594926053/TRIPSMAP/followers_picture/christopher-campbell-rDEOVtE7vOs-unsplash_zeg3lt.jpg'
]

puts "Creation followers pour JohnDoe"


10.times do |i|
  create_user("person#{i}@gmail.com", Faker::FunnyName.name, "topsecret", followers_photos_path[i])
  u = User.last
  f = Follower.new
  f.user = User.find(1)
  f.follower_pseudo = u.pseudo
  # f.name = Faker::FunnyName.name
  # file = URI.open(followers_photos_path[i])
  # f.photo.attach(io: file, filename: "avatar#{i}.jpg", content_type: "image/jpg")
  # "person_#{i}"
  f.save
end


puts "Creation trips"

trip_titles = [
  "Ambiance temple, jungle et marchés nocturnes au Cambodge",
  "Road-trip aux US",
  "Petite escapade en Italie",
  "Road trip en Thaïlande",
  "A la découverte du Japon",
  "Les merveilles du Nepal",
  "Voyage en Amérique latine",
  "Sphynx, pyramides et plongée en Egypte",
  "Au bout du monde: Australie & Nouvelle Zélande"
]

trip_dates = [
  ["03/04/2019", "06/05/2019"],
  ["03/06/2020", "06/07/2020"],
  ["03/06/2017", "10/06/2017"],
  ["03/04/2017", "06/05/2017"],
  ["03/06/2018", "06/07/2018"],
  ["03/06/2019", "10/06/2019"],
  ["03/04/2016", "06/05/2016"],
  ["03/06/2019", "06/07/2019"],
  ["03/06/2020", "10/06/2020"]
]

trip_cover_picture_path = [
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467725/TRIPSMAP/trip_cover_pictures/james-wheeler-WXqvglwd4hU-unsplash_syauut.jpg",
  "https://images.unsplash.com/photo-1494783367193-149034c05e8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467377/TRIPSMAP/trip_cover_pictures/Thailande/debbie-molle-6DSID8Ey9-U-unsplash_qmtm3x.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467554/TRIPSMAP/trip_cover_pictures/martijn-baudoin-c_uHShdMI4Q-unsplash_uosz93.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467612/TRIPSMAP/trip_cover_pictures/prasesh-shiwakoti-lomash-NHh19i0IhO8-unsplash_hs4set.jpg",
  "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467778/TRIPSMAP/trip_cover_pictures/jeremy-bishop-HcgK4WoBwzg-unsplash_o27und.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467827/TRIPSMAP/trip_cover_pictures/keith-zhu-qaNcz43MeY8-unsplash_t8lo68.jpg"
]

def create_trip(title, starts_on, ends_on, cover_picture_path, user)
  t = Trip.new(title: title, starts_on: starts_on, ends_on: ends_on)
  t.user = user
  file = URI.open(cover_picture_path)
  t.cover_picture.attach(io: file, filename: "pic#{Trip.count + 1}.extension", content_type: "image/png")
  t.save!
end

# trip_titles.each_with_index do |title, index|
  create_trip(trip_titles[0], trip_dates[0][0], trip_dates[0][1], trip_cover_picture_path[0], User.first)
  create_trip(trip_titles[1], trip_dates[1][0], trip_dates[1][1], trip_cover_picture_path[1], User.second)
  create_trip(trip_titles[2], trip_dates[2][0], trip_dates[2][1], trip_cover_picture_path[2], User.last)
  create_trip(trip_titles[3], trip_dates[3][0], trip_dates[3][1], trip_cover_picture_path[3], User.first)
  create_trip(trip_titles[4], trip_dates[4][0], trip_dates[4][1], trip_cover_picture_path[4], User.second)
  create_trip(trip_titles[5], trip_dates[5][0], trip_dates[5][1], trip_cover_picture_path[5], User.last)
  create_trip(trip_titles[6], trip_dates[6][0], trip_dates[6][1], trip_cover_picture_path[6], User.first)
  create_trip(trip_titles[7], trip_dates[7][0], trip_dates[7][1], trip_cover_picture_path[7], User.second)
  create_trip(trip_titles[8], trip_dates[8][0], trip_dates[8][1], trip_cover_picture_path[8], User.last)
# end

puts "Creation steps"
# title, location, nb_of_days, trip_id, cover_picture

step_titles = [
  ["Temples Khmers", "Pagodes à Phnom Penh", "Farniente à Sihanoukville", "Marais salants et poivriers"],
  ["Floride", "Illinois", "Texas", "Californie", "Nevada", "Arizona", "Utah"],
  ["La mythique", "La splendide", "La merveilleuse", "La sublime"],
  ["Ville nouvelle", "La fourmilière", "Eau turquoise et sable fin", "Seul au monde"],
  ["Dépaysement total", "Sanctuaires et Samuraï", "Temple de la gastronomie", "Temples et montagnes", "L'inquiétante"],
  ["Découverte du bouddhisme", "Monastère de Kopan", "Jardins de Lumbini", "Le meilleur café au monde"],
  ["Lima, capitale du Pérou", "Bienvenue en Bolivie", "Iquique", "Cascades de rêve", "Tango!"],
  ["Les pyramides", "La ville de l'or", "Excursion dans le Sinaï", "Port immortel"],
  ["La fascinante", "Découverte des vignobles", "Ambiance surf et robinson crusoé", "Pêche et plongée", "La fascinante"]
]

locations = [
  ["Siem Reap", "Phnom Penh", "Sihanoukville", "Kampot"],
  ["Miami", "Chicago", "Dallas", "Los Angeles", "Las Vegas", "Grand Canyon", "Salt Lake City"],
  ["Rome", "Venise", "Florence", "Milan"],
  ["Chiang Mai", "Bangkok", "Koh phi phi", "Koh Tao"],
  ["Tokyo", "Osaka", "Kyoto", "Kamakura", "Hiroshima"],
  ["Bodnath", "Kopan", "Lumbini", "Katmandou"],
  ["Lima", "Isla Del Sol", "Iquique", "Ushuaïa", "Buenos Aires"],
  ["Caire", "Dahab", "Charm el-Cheikh", "Alexandrie"],
  ["Sydney", "Melbourne", "Gold Coast", "Auckland", "Queenstown"]
]

def create_step(title, location, trip_id, rank)
  s = Step.new(title: title, location: location)
  s.nb_of_days = [2,3,4,5].sample
  s.trip_id = trip_id
  s.id_in_its_trip = rank
  s.save!
end

step_titles.each_with_index do |itinerary, i|
  itinerary.each_with_index do |step_title, j|
    create_step(step_title, locations[i][j], i + 1, j + 1)
  end
end

puts "Creation blocks"
#text, mediatype, step_id

file = 'blocks_seed.yml'
SAMPLE = YAML::load_file(File.join(__dir__, file))

def attach_file_to_block(path, mediatype, b)
  file = URI.open(path)
  if mediatype === "photos"
    b.files.attach(io: file, filename: "photo.png", content_type: "image/png")
  elsif mediatype === "video"
    b.files.attach(io: file, filename: "video.mp4", content_type: "video/mp4")
  end
end

def create_block(trip_id, step_id, block_id)
  block = SAMPLE[trip_id][step_id][block_id]
  b = Block.new(block.slice("mediatype"))
  b.step = Trip.find(trip_id + 1).steps[step_id]
  if block["mediatype"] === "text"
    b.text = block["text"]
  elsif block["mediatype"] === "photos"
    block["photos_paths"].each { |path| attach_file_to_block(path, "photos", b) }
  elsif block["mediatype"] === "video"
    attach_file_to_block(block["video_path"], "video", b)
  end
  b.save!
end

# puts SAMPLE

# SAMPLE.each_with_index do |trip, trip_id|
#   puts ""
#   puts "------ trip #{trip_id} ------"
#   puts ""
#   SAMPLE[trip_id].each_with_index do |step, step_id|
#     SAMPLE[trip_id][step_id].each_with_index do |block, block_id|
#       puts "step: #{step_id} block: #{block_id}"
#       create_block(trip_id, step_id, block_id)
#     end
#   end
# end

SAMPLE.each_with_index do |trip|
  puts ""
  puts "------ trip #{trip[0]} ------"
  puts ""
  SAMPLE[trip[0]].each_with_index do |step, step_id|
    SAMPLE[trip[0]][step_id].each_with_index do |block, block_id|
      puts "step: #{step_id} block: #{block_id}"
      create_block(trip[0], step_id, block_id)
    end
  end
end

puts "Seed done :)"
