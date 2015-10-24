class PlayersController < ApplicationController
  def create
    if Player.create(player_params)
      head :created
    else
    end
  end

  private
  def player_params
    params.require(:player).permit(:handle)
  end
end
