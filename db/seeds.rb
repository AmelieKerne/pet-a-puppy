# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "creating users"
Booking.destroy_all
Puppy.destroy_all
User.destroy_all
2.times do
  user = User.new(
    #name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "123456",
  )
  user.save!
end
puts "users created"

puts "creating puppies"

10.times do
  file = URI.open('https://alop.org/wp-content/uploads/2014/12/happy-dog.jpg')
   puppy = Puppy.new(
    name: Faker::Superhero.name,
    description: Faker::ChuckNorris.fact,
    price: Faker::Commerce.price.to_i,
    user: User.first,
    address: "Berlin",
  )
  puppy.photo.attach(io: file, filename: "puppy_profile_picture.jpg", content_type: 'image/jpg')
  puppy.save!
end

puts "puppies created"
