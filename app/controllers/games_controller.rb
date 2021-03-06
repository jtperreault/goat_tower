class GamesController < ApplicationController
  include PlayerIdentifier

  before_action :set_game, :confirm_game_active, :confirm_game_player, except: [:create]

  def create
    @game = Game.new(player: player)

    if @game.save
      render json: @game, status: 201
    else
      render json: { errors: @game.errors }, status: 400
    end
  end

  def update
    @game.continue
    render json: @game, status: 200
  end

  private

  def game_params
    params.require(:game).permit(:id, :player)
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def confirm_game_player
    unless @game.player == player
      render json: { errors: { game: ['is being played by someone else'] } }, status: 400
    end
  end

  def confirm_game_active
    unless @game.active
      render json: { errors: { game: ['is inactive'] } }, status: 400
    end
  end
end
