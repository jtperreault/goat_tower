class CommandsController < ApplicationController
  include PlayerIdentifier

  before_action :check_if_player_exists, only: [:index]

  def index
    render json: player.commands
  end

  private

  def check_if_player_exists
    unless player
      render json: ['start']
    end
  end
end
