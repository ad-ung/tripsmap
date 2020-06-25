# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

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
User.create!(email: "johndoe@gmail.com", pseudo: "John_Doe", password: "topsecret")

puts "Creation trips"

trip_titles = [
  "Voyage en Amérique latine",
  "Road-trip aux US",
  "Petite escapade en Italie"
]

trip_dates = [
  ["03/04/2018", "06/05/2018"],
  ["03/06/2019", "06/07/2019"],
  ["03/06/2020", "10/06/2020"]
]

trip_cover_picture_path = [
  "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1494783367193-149034c05e8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80"
]

def create_trip(title, starts_on, ends_on, cover_picture_path, extension)
  t = Trip.new(title: title, starts_on: starts_on, ends_on: ends_on)
  t.user = User.find(1)
  file = URI.open(cover_picture_path)
  t.cover_picture.attach(io: file, filename: "pic#{Trip.count + 1}.extension", content_type: "image/#{extension}")
  t.save!
end

trip_titles.each_with_index do |title, index|
  create_trip(title, trip_dates[index][0], trip_dates[index][1], trip_cover_picture_path[index], "jpg")
end
