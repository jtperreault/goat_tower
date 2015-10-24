class GamesController < ApplicationController
  include PlayerIdentifier

  def create
    render json: Game.create(player: player)
  end

  private

  def game_params
    params.require(:game).permit(:player)
  end
end
