# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require "open-uri"

property_types = ['apartment', 'villa', 'town house']


PropertyListing.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?

user1 = User.create(
        email: "test1@test.com",
        password: "123456",
        first_name: "Bob",
        last_name: "Plant",
        phone_number: "+55 555 5555",
)

user2 = User.create(
        email: "test2@test.com",
        password: "123456",
        first_name: "Pete",
        last_name: "Build",
        phone_number: "+55 555 5555",
)

users = [user1, user2]
img_randomizer =['big','modern','new']


5.times do

  property = PropertyListing.new(
    title: Faker::Hipster.sentence(word_count: 3),
    sub_title: Faker::Hipster.sentence(word_count: 5),
    description: Faker::Hipster.sentence(word_count: 10),
    location: Faker::Address.state,
    property_type: property_types.sample,
    listing_price: rand(1...10) * 1000000,
    number_of_bedrooms: rand(1...6),
    number_of_bathrooms: rand(1...4),
    property_size: rand(1...10) * 500,
    number_of_parking_spaces: rand(1...4),
    amenities: "None",
    year_built: rand(1900...2020),
    user: users.sample
  )

  house_image = URI.open("https://source.unsplash.com/featured/?home,#{img_randomizer.sample}")
  property.image.attach(io: house_image, filename: 'house.jpg', content_type: 'image/jpg')
  property.save
end
