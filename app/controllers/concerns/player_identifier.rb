module PlayerIdentifier
  extend ActiveSupport::Concern

  def player
    Player.find_by_handle(player_params["handle"])
  end

  private

  def player_params
    params.require(:player).permit(:handle)
  end
end
