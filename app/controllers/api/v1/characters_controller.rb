class Api::V1::CharactersController < ApplicationController
  def index
    @characters = Character.all
    render json: @characters
  end


  def houses
    character = Character.all.map(&:url)
    region_houses = GameOfThronesApi.get_houses.select do |house|
      house['region'] == params[:house].split('_').join(' ')
    end

    character_houses = region_houses.reject do |house|
      character & house['swornMembers'] == []
    end

    keys = %w[url name region coatOfArms words seats swornMembers]

    @houses = character_houses.map { |house| house.slice(*keys) }

    render json: @houses
  end
end
