# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Author.create!(first_name: 'JRR', last_name: 'Tolkien'),
Author.create!(first_name: 'Mercedes', last_name: 'Lackey'),
Author.create!(first_name: 'CS', last_name: 'Lewis'),
Author.create!(first_name: 'Louise', last_name: 'Erdrich'),