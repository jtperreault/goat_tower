class GamesController < ApplicationController
  include PlayerIdentifier

  def create
    @game = Game.new(player: player)

    if @game.save
      render json: @game, status: 201
    else
      render json: { error: { message: 'Unable to create game.' } }, status: 500
    end
  end

  def update
  end

  private

  def game_params
    params.require(:game).permit(:player)
  end
end
