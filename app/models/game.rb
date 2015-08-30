class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :level

  validates_presence_of :player, :level
  validate :player_cannot_have_multiple_games_active

  def player_cannot_have_multiple_games_active
    if Game.where(player: self.player).where(active: true).any?
      errors.add(:player, "has an active game")
    end
  end
end
