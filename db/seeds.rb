require "open-uri"

puts "Creating users"
Booking.destroy_all
Puppy.destroy_all
User.destroy_all

names = %w[amelie lena mohit]
names.each do |name|
  name = User.new(
    email: "#{name}@example.com",
    password: "123456",
  )
  name.save!
end

puts "#{User.count} users created"

puts "Creating puppies"
addresses = [
  "Rudi-Dutschke-Straße 26, 10969 Berlin",
  "Pariser Platz, 10117, Berlin",
  "Platz der Republik 1, 11011, Berlin",
  "Bodestraße 1-3, 10178 Berlin",
  "Bernauer Straße 111, 13355 Berlin",
  "Unter den Linden 2, 10117 Berlin",
  "Panoramastraße 1 A, 10178 Berlin",
  "Friedrichstraße 43-45, 10969 Berlin",
  "Spandauer Damm 10, 14059 Berlin",
  "Gendarmenmarkt, 10117 Berlin",
  "Lindenstraße 9-14, 10969 Berlin",
  "Trebbiner Straße 9, D-10963 Berlin-Kreuzberg",
  "Cora-Berliner-Straße 1, 10117 Berlin",
  "Str. des 17. Juni, 10785 Berlin",
  "Bodestraße 1-3, 10178 Berlin",
  "Schloßpl. 1, 10178 Berlin",
  "Am Lustgarten, 10178 Berlin",
  "Niederkirchnerstraße 8, 10963 Berlin",
  "Hardenbergplatz 8, 10787 Berlin",
  "Königin-Luise-Strasse 6-8, 14195 Berlin",
  "Nikolaikirchplatz, 10178 Berlin",
  "Breitscheidplatz, 10789 Berlin"
]

21.times do |i|
  file = URI.open('https://pupbox.com/wp-content/themes/pupbox-jb/assets/blog.v2/posts-by-age/puppy-running2.jpg')
   puppy = Puppy.new(
    name: Faker::Creature::Dog.name,
    description: "Nice, cute and lovely puppy. Usually very sociable, #{Puppy.name} likes playing with other animals but can get nervous with kids if they steal him the show! Small and light, #{Puppy.name} can easily come with you for all your next adventures, let it be just next to your door, or to explore other areas. #{Puppy.name} is used to travel by bike, car and bus. Be careful with the train, #{Puppy.name} gets sick then! In short: book #{Puppy.name}, be happy :D",
    price: rand(1..5),
    user: User.find(rand(User.first.id..User.first.id + 2)),
    address: addresses[i],
  )
  puppy.save!
  puppy.photo.attach(io: file, filename: "puppy_profile_picture.jpg", content_type: 'image/jpg')
end
puts "#{Puppy.count} puppies created"
