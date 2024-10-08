# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
10.times do |i|
  place=Place.create!(
    name:Faker::Address.street_address,
    description:Faker::Lorem.paragraph,
    city:Faker::Address.city,
    state:Faker::Address.state,
    country:Faker::Address.country,
    latitude:Faker::Address.latitude,
    longitude:Faker::Address.longitude
  )
  puts "place #{i+1} created successfully"

  3.times do |i|
    place.images.create!(url: "https://loremflickr.com/200/200?random=#{i+1}")
  end


end

