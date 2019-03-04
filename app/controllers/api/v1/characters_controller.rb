class Api::V1::CharactersController < ApplicationController
  def index
    @characters = Character.all
    render json: @characters
  end

  def houses
    @houses = GameOfThronesApi.get_houses.select do |house|
      house['region'] == params[:house].split('_').join(' ')
    end
    render json: @houses
  end
end
