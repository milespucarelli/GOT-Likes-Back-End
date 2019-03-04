# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

filtered_response = GameOfThronesApi.get_characters.select do |character|
  character["playedBy"] != [""] && character["tvSeries"].length > 3
end

filtered_response.each do |character|
  Character.create(
    name: character['name'],
    house: character['house'],
    gender: character['gender'],
    culture: character['culture'],
    playedBy: character['playedBy'][0]
  )
end
