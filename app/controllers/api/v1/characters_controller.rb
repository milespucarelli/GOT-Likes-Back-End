class Api::V1::CharactersController < ApplicationController
  skip_before_action :authorized

  def index
    @characters = Character.all
    render json: @characters
  end


  def houses
    character = Character.all.map {|character| character.url}
    @houses = GameOfThronesApi.get_houses.select do |house|
      house['region'] == params[:house].split('_').join(' ')
    end

    @houses = @houses.select do |house|
      character & house['swornMembers'] != []
    end

    keys = ['url', 'name', 'region', 'coatOfArms', 'words', 'seats', 'swornMembers']

    @houses = @houses.map { |house| house.slice(*keys) }

    render json: @houses
  end
end
