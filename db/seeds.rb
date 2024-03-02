# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
puts "Starting seeding..."
puts "Clearing existing data..."
Booking.destroy_all
Event.destroy_all
Hobby.destroy_all
Review.destroy_all
User.destroy_all
# # Seed data for users
# 5.times do
#   User.create!(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: 'password123'
#   )
# end
# puts "users done..."
# # Seed data for hobbies
# 5.times do
#   Hobby.create!(
#     name: Faker::Name.first_name,
#     user: User.first
#   )
# end
# puts "hobbies done..."
# # Seed data for events
# 5.times do
#   Event.create!(
#     name: Faker::Name.first_name,
#     hobby: Hobby.first
#   )
# end
# puts "events done..."
# # Seed data for bookings
# 5.times do
#   Booking.create!(
#     user: User.first,
#     event: Event.first
#   )
# end
# puts "bookings done..."
# # Seed data for reviews
# 5.times do
#   Review.create!(
#     comment: Faker::Lorem.paragraph,
#     booking: Booking.first
#   )
# end
# puts "reviews done..."

User.create!(
  email: 'admin@example.com',
  password: 'password', # Set your desired password here
  password_confirmation: 'password', # Also required for bcrypt
  first_name: 'AD',
  last_name: 'User',
  admin: true
)

puts "Seeding completed."
