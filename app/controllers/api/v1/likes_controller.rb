class Api::V1::LikesController < ApplicationController
  skip_before_action :authorized

  def index
    @likes = Like.all
    render json: @likes
  end

  def create
    @like = Like.create(like_params)
    # byebug
    render json: @like
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :character_id)
  end
end
