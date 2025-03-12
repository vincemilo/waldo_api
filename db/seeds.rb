# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

EasyCharacter.destroy_all

[ { name: "waldo", x_ratio: 0.86, y_ratio: 0.74 }, { name: "wilma", x_ratio: 0.49, y_ratio: 0.42 }, { name: "wizard", x_ratio: 0.71, y_ratio: 0.76 }, { name: "odlaw", x_ratio: 0.32, y_ratio: 0.64 }  ].each do |character|
  EasyCharacter.create!(name: character[:name], x_ratio: character[:x_ratio], y_ratio: character[:y_ratio])
end

p "Created #{EasyCharacter.count} easy characters"

Character.destroy_all

[ { name: "waldo", x_ratio: 0.37, y_ratio: 0.43 }, { name: "wilma", x_ratio: 0.69, y_ratio: 0.53 }, { name: "wizard", x_ratio: 0.55, y_ratio: 0.29 }, { name: "odlaw", x_ratio: 0.17, y_ratio: 0.31 }  ].each do |character|
  Character.create!(name: character[:name], x_ratio: character[:x_ratio], y_ratio: character[:y_ratio])
end

p "Created #{Character.count} hard characters"

EasyHighScore.destroy_all
HighScore.destroy_all

score = 9999
characters = Character.all

11.times {
EasyHighScore.create!(name: characters.find(rand(characters.first.id..characters.first.id + 3)).name.capitalize, time: score)
HighScore.create!(name: characters.find(rand(characters.first.id..characters.first.id + 3)).name.capitalize, time: score)
score += 1}

p "Created #{EasyHighScore.count} easy scores"
p "Created #{HighScore.count} hard scores"
