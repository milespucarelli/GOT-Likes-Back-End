# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.destroy_all

response_string = RestClient.get('https://api.got.show/api/characters/')
response_hash = JSON.parse(response_string)

filtered_response = response_hash.select do |character|
  character.key?('pageRank') && character['pageRank'] > 199
end

filtered_response.each do |character|
  Character.create(
    name: character['name'],
    house: character['house'],
    male: character['male'],
    culture: character['culture'],
    imageLink: character['imageLink']
  )
end
