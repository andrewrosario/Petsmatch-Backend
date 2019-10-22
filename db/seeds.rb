# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

def image_fetcher
    open(Faker::Avatar.image)
    rescue
    open("https://robohash.org/sitsequiquia.png?size=300x300&set=set1")
end

def pet_image_fetches
    open('http://placegoat.com/200')
end

# 20.times do |n|
#   s = Student.create(
#      ...
#      #remove profile_picture from here
#   )

#   s.profile_picture.attach({
#      io: image_fetcher,
#      filename: "#{n}_faker_image.jpg"
#   })
# end

100.times do |i|
    this_user = User.create(
        name: Faker::Name.name,
        age: rand(18...99),
        gender: Faker::Gender.type,
        bio: Faker::GreekPhilosophers.quote,
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password',
        zipcode: 78701
    )
    # this_user.image.attach(io: File.open(File.join(File.dirname(__FILE__), 'user.png')), filename: 'user.png')
    this_user.image.attach({
        io: image_fetcher,
        filename: "#{i}_faker_image.jpg"
     })
    rand(1...3).times do |j|
        this_pet = Pet.create(
            user_id: i + 1,
            name: Faker::Creature::Cat.name,
            age: rand(1...20),
            species: Faker::Creature::Animal.name,
            breed: Faker::Creature::Cat.breed,
            category: ['Cat', 'Dog', 'Fish', 'Bird', 'Reptile', 'Exotic'].sample
        )
        # this_pet.image.attach(io: File.open(File.join(File.dirname(__FILE__), 'Random-25-512.png')), filename: 'Random-25-512.png')
        this_pet.image.attach({
            io: pet_image_fetches,
            filename: "#{i}_faker_image.jpg"
         })
    end
end


