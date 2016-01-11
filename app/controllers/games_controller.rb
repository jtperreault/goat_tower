class GamesController < ApplicationController
  include PlayerIdentifier

  def create
    @game = Game.new(player: player)

    if @game.save
      render json: @game, status: 201
    else
      render json: { errors: @game.errors }, status: 400
    end
  end

  def update
  end

  private

  def game_params
    params.require(:game).permit(:player)
  end
end
