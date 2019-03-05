Character.destroy_all

filtered_response = GameOfThronesApi.get_characters.select do |character|
  character['playedBy'] != [''] && character['tvSeries'].length > 3
end

filtered_response.each do |character|
  house = { 'name' => 'No house' }
  if character['allegiances'].length.positive?
    house = GameOfThronesApi.get_houses.find do |h|
      h['url'] == character['allegiances'][0]
    end
  end

  Character.create(
    url: character['url'],
    name: character['name'],
    house: house['name'],
    gender: character['gender'],
    culture: character['culture'],
    playedBy: character['playedBy'][0]
  )
end
