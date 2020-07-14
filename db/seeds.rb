# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "yaml"

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

create_user("johndoe@gmail.com", "John_Doe", "topsecret", "https://res.cloudinary.com/datbhgbcq/image/upload/v1591267983/avatar_sx4zw0.jpg")
create_user("janedoe@gmail.com", "Adeline_U", "topsecret", "https://res.cloudinary.com/dgsutja6q/image/upload/v1594752028/P1170915_tx7cpm.jpg")
create_user("jean-mi@gmail.com", "JeanMi_123", "topsecret", "https://res.cloudinary.com/dgsutja6q/image/upload/v1594752040/nicolas-horn-MTZTGvDsHFY-unsplash_ia6ohd.jpg")

puts "Creation trips"

trip_titles = [
  "Voyage en Amérique latine",
  "Road-trip aux US",
  "Petite escapade en Italie",
  "Road trip en Thaïlande",
  "A la découverte du Japon",
  "Les merveilles du Nepal",
  "Ambiance temple, jungle et marchés nocturnes au Cambodge",
  "Sphynx, pyramides et plongée en Egypte",
  "Au bout du monde: Australie & Nouvelle Zélande"
]

trip_dates = [
  ["03/04/2016", "06/05/2016"],
  ["03/06/2016", "06/07/2016"],
  ["03/06/2017", "10/06/2017"],
  ["03/04/2017", "06/05/2017"],
  ["03/06/2018", "06/07/2018"],
  ["03/06/2019", "10/06/2019"],
  ["03/04/2019", "06/05/2019"],
  ["03/06/2019", "06/07/2019"],
  ["03/06/2020", "10/06/2020"]
]

trip_cover_picture_path = [
  "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1494783367193-149034c05e8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467377/TRIPSMAP/trip_cover_pictures/Thailande/debbie-molle-6DSID8Ey9-U-unsplash_qmtm3x.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467554/TRIPSMAP/trip_cover_pictures/martijn-baudoin-c_uHShdMI4Q-unsplash_uosz93.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467612/TRIPSMAP/trip_cover_pictures/prasesh-shiwakoti-lomash-NHh19i0IhO8-unsplash_hs4set.jpg",
  "https://res.cloudinary.com/datbhgbcq/image/upload/c_scale,w_1350/v1594467725/TRIPSMAP/trip_cover_pictures/james-wheeler-WXqvglwd4hU-unsplash_syauut.jpg",
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
  ["Lima, capitale du Pérou", "Bienvenue en Bolivie", "Iquique", "Cascades de rêve", "Tango!"],
  ["Floride", "Illinois", "Texas", "Californie", "Nevada", "Arizona", "Utah"],
  ["La mythique", "La splendide", "La merveilleuse", "La sublime"],
  ["Ville nouvelle", "La fourmilière", "Eau turquoise et sable fin", "Seul au monde"],
  ["Dépaysement total", "Sanctuaires et Samuraï", "Temple de la gastronomie", "Temples et montagnes", "L'inquiétante"],
  ["Découverte du bouddhisme", "Monastère de Kopan", "Jardins de Lumbini", "Le meilleur café au monde"],
  ["Temples Khmers", "Pagodes à Phnom Penh", "Farniente à Sihanoukville", "Marais salants et poivriers"],
  ["Les pyramides", "La ville de l'or", "Excursion dans le Sinaï", "Port immortel"],
  ["La fascinante", "Découverte des vignobles", "Ambiance surf et robinson crusoé", "Pêche et plongée", "La fascinante"],


]

locations = [
  ["Lima, Pérou", "Isla Del Sol, Bolivie", "Pica, Chili", "Ushuaïa, Argentine", "Buenos Aires, Argentine"],
  ["Miami", "Chicago", "Dallas", "Los Angeles", "Las Vegas", "Grand Canyon", "Salt Lake City"],
  ["Rome", "Venise", "Florence", "Milan"],
  ["Chiang Mai", "Bangkok", "Koh phi phi", "Koh Tao,"],
  ["Tokyo", "Osaka", "Kyoto", "Kamakura", "Hiroshima"],
  ["Bodnath", "Kopan", "Lumbini", "Katmandou"],
  ["Angkor", "Phnom Penh", "Sihanoukville", "Kampot" ],
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

SAMPLE.each_with_index do |trip, trip_id|
  puts ""
  puts "------ trip #{trip_id} ------"
  puts ""
  SAMPLE[trip_id].each_with_index do |step, step_id|
    SAMPLE[trip_id][step_id].each_with_index do |block, block_id|
      puts "step: #{step_id} block: #{block_id}"
      create_block(trip_id, step_id, block_id)
    end
  end
end

=begin
def create_block_text(trip_id, step_id, block_id)
  b = Block.new(SAMPLE[trip_id][step_id][block_id])
  b.step = Trip.find(trip_id + 1).steps[step_id]
  b.save!
end

def create_block_photos(trip_id, step_id, block_id)
  b = Block.new(SAMPLE[trip_id][step_id][block_id].slice("mediatype"))
  b.step = Trip.find(trip_id + 1).steps[step_id]
  SAMPLE[trip_id][step_id][block_id]["photos_paths"].each do |path|
    file = URI.open(path)
    b.files.attach(io: file, filename: "photo.png", content_type: "image/png")
  end
  b.save!
end

def create_block_video(trip_id, step_id, block_id)
  b = Block.new(SAMPLE[trip_id][step_id][block_id].slice("mediatype"))
  b.step = Trip.find(trip_id + 1).steps[step_id]
  file = URI.open(SAMPLE[trip_id][step_id][block_id]["video_path"])
  b.files.attach(io: file, filename: "video.mp4", content_type: "video/mp4")
  b.save!
end



# puts SAMPLE[0][0][0]
# puts SAMPLE.size

SAMPLE.each_with_index do |trip, trip_id|
  puts ""
  puts "------ trip #{trip_id} ------"
  puts ""
  SAMPLE[trip_id].each_with_index do |step, step_id|
    SAMPLE[trip_id][step_id].each_with_index do |block, block_id|

      puts "step: #{step_id} block: #{block_id}"

      if SAMPLE[trip_id][step_id][block_id]["mediatype"] === "text"
        create_block_text(trip_id, step_id, block_id)
      elsif SAMPLE[trip_id][step_id][block_id]["mediatype"] === "photos"
        create_block_photos(trip_id, step_id, block_id)
      elsif SAMPLE[trip_id][step_id][block_id]["mediatype"] === "video"
        create_block_video(trip_id, step_id, block_id)
      end
    end
  end
end

=end

puts "Seed done :)"

# texts = [
#   "Le soir, on décide de ne pas camper à Anza Borrego, il fait mille fois trop chaud, et on s’arrête dans les montagnes à Julian, la ville de la pomme, et une ancienne mine d’or. On y était déjà passé il y a deux ans, et ça fait plaisir de retrouver la fraîcheur et la verdure des montagnes. Je trouve une cabane des plus mignonnes sur AirBnb.",
#   "Notre camping est à 1 bonne heure de route du parc national de Petrified Forest, ou la forêt pétrifiée. On roule sur un plateau, c’est plat à perte de vue, même si la route fait des bonds de temps en temps.",
#   "Aujourd’hui, c’est un jour de route, du vrai bon road trip comme on l’aime : rouler, traverser des beaux paysages.",
#   "Il est presque 19h30, après avoir posé les valises au motel, on file à White Sands Dunes, à une quinzaine de minutes de là : le soleil se couche, le ciel est tout noir d’un côté, et de l’autre, c’est festival de rose et bleu, de fin de soirée. Mais le vrai spectacle, c’est marcher dans le sable blanc : on se croirait à Boston en plein hiver, à marcher dans la neige. Magnifique !",
#   "A notre retour sur le parking du début de chemin, 2 buddies (des mecs, retraités) discutent et nous proposent une bière. On restera discuter avec Duane jusqu’à tard le soir, c’est un ancien ranger qui a fait le Vietnam et qui passe son temps à sillonner le pays dans sa Casita, une petite caravane.",
#   "Le midi, on fait la pause la plus relaxante du monde, au ranch de Frijole : une oasis de verdure et de fraîcheur en plein désert, toujours dans le parc national (merci le ranger pour le conseil !) On pique-nique puis on fait la sieste sur un banc, en écoutant la source s’écouler. Tout serait parfait si on ne savait pas que des tarentules-vautours et autres bêtes du désert rôdent dans les parages.",
#   "Le soir, on se refait un barbecue, on regarde les chauve-souris sortir du dessous du pont et puis on écoute de la musique live dans un bar : gros coup de cœur pour l’ambiance de la ville !",
#   "Notre Airbnb n’est dispo qu’après 15h30, j’ai trouvé une tiny house, et j’ai hâte de voir à quoi ça ressemble. Manu trouve ça bizarre d’avoir choisi un truc minuscule alors qu’on va camper pendant 15 jours (ou presque) mais moi je suis sûre que ça va être super.",
#   "La ville est toute petite, très touristique, et un peu carton-pâte sur les bords. Même si le côté folko-mytho des multiples musées sur les sorcières peut être décevant, il y a aussi d’autres choses sympa à voir à Salem, car la ville a longtemps été un centre commercial portuaire majeur, et en a gardé quelques vestiges intéressants, de belles maisons, et un superbe musée.",
#   "Arrivée à destination, nous avons passé trois jours à arpenter tous les quartiers de la ville, mais plus particulièrement la vieille ville. Une ville bouillonnante qui nous a plus immédiatement..",
#   "Les journées remplies de visites culturelles et de miradors, les soirées occupées par des fiestas, des concerts, des dîners savoureux, cette ville mérite vraiment de s'y attarder un peu.",
#   "Une fois sur place, nous avons visité cette ville magnifique, son centre historique avec sa place des Armes et sa cathédrale majestueuse mais surtout son sublime couvent dans lequel nous avons passé la majorité de notre temps."
# ]

# photos_path = [
#   "https://images.unsplash.com/photo-1529456559600-c3e56a82b3e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
#   "https://images.unsplash.com/photo-1547044770-89ab01ce15c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
#   "https://images.unsplash.com/photo-1577453824393-9150575ed402?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
#   "https://images.unsplash.com/photo-1592520172240-129bf16547b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1347&q=80",
#   "https://images.unsplash.com/photo-1592520172240-129bf16547b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1347&q=80",
#   "https://images.unsplash.com/photo-1521058798685-39dd95c33314?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
#   "https://images.unsplash.com/photo-1568910630345-9216afd16d43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
#   "https://images.unsplash.com/photo-1542297849-fd63ad7543fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1527&q=80",
#   "https://images.unsplash.com/photo-1542297849-fd63ad7543fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1527&q=80",
#   "https://images.unsplash.com/photo-1542297849-fd63ad7543fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1527&q=80",
#   "https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
#   "https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
#   "https://images.unsplash.com/photo-1507295386538-ddd5e86cd597?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
#   "https://images.unsplash.com/photo-1517792844039-e52afb564132?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=629&q=80",
#   "https://images.unsplash.com/photo-1517792844039-e52afb564132?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=629&q=80",
#   "https://images.unsplash.com/photo-1518098268026-4e89f1a2cd8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80",
#   "https://images.unsplash.com/photo-1496864137062-a12b5defe6be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
#   "https://images.unsplash.com/photo-1513581166391-887a96ddeafd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
#   "https://images.unsplash.com/photo-1514890547357-a9ee288728e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
# ]

# videos_path = [
#   "https://player.vimeo.com/external/344790667.sd.mp4?s=1a24517af312cda1e841ad6d71717e458379d494&profile_id=139&oauth2_token_id=57447761",
#   "https://player.vimeo.com/external/363636035.sd.mp4?s=8d1dd6d4ab6cd0f13e33bce2dd008c5a7c957b78&profile_id=139&oauth2_token_id=57447761",
#   "https://player.vimeo.com/external/394438734.sd.mp4?s=948877f1cd185b9bb4640eed6da510f5cbfe18ac&profile_id=139&oauth2_token_id=57447761"
# ]

# def create_block_text(text, trip_id, step_id)
#   b = Block.new
#   b.mediatype = "text"
#   b.text = text
#   b.step = Trip.find(trip_id).steps[step_id - 1]
#   b.save!
# end

# def create_block_photos(photos_paths, trip_id, step_id)
#   b = Block.new
#   b.mediatype = "photos"
#   b.step = Trip.find(trip_id).steps[step_id - 1]
#   photos_paths.each do |path|
#     file = URI.open(path)
#     b.files.attach(io: file, filename: "photo.png", content_type: "image/png")
#   end
#   b.save!
# end

# def create_block_video(video_path, trip_id, step_id)
#   b = Block.new
#   b.mediatype = "video"
#   b.step = Trip.find(trip_id).steps[step_id - 1]
#   file = URI.open(video_path)
#   b.files.attach(io: file, filename: "video.mp4", content_type: "video/mp4")
#   b.save!
# end

# create_block_text(texts.sample, 1, 1)
# create_block_photos(photos_path.sample(2), 1, 1)
# create_block_text(texts.sample, 1, 1)
# create_block_photos(photos_path.sample(3), 1, 1)
# create_block_video(videos_path.sample, 1, 1)


