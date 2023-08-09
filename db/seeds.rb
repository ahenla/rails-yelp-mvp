# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning the DB...'
Restaurant.destroy_all

puts 'Creating pets...'
20.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number
  )
  5.times do
    review = Review.new(
      rating: (0..5).to_a.sample,
      content: Faker::Restaurant.review
    )
    review.restaurant = restaurant
    review.save
  end
end

puts "... created #{Restaurant.count} + #{Review.count}"
