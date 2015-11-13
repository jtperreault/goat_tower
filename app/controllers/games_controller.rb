class GamesController < ApplicationController
  include PlayerIdentifier

  def create
    render json: Game.create(player: player), status: 201
  end

  private

  def game_params
    params.require(:game).permit(:player)
  end
end
