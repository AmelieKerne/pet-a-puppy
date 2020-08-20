# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Cleaning database..."
Puppy.destroy_all

puts "Creating some puppies..."
8.times do
  puppy = Puppy.create(
    name: Faker::FunnyName.two_word_name,
    price: rand(1..5),
    description: Faker::Creature::Dog.meme_phrase,
    user_id: 1
       )
  puts "Puppy with id #{puppy.id} was created"
  puppy.photo.attach(io:
    File.open(File.join(Rails.root,'app/assets/images/puppy.jpeg')), filename: 'puppy')
end


puts "Created #{Puppy.count} puppies"
