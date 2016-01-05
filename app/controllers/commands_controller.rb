class CommandsController < ApplicationController
  include PlayerIdentifier

  before_action :new_player_response, only: [:index]

  def index
    render json: player.commands
  end

  private

  def new_player_response
    unless player
      render json: ['start']
    end
  end
end
