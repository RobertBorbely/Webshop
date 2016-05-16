# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
Product.create!(name: "First item", description: "Whoo add more me!", price: 10, count: 10)
Review.create!(product_id: 1, rating: 5, user_id: 1, text: 'First review')