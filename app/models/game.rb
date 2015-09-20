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

  def continue
    # check for level +1
    # select situation
  end

  def end_game
    update_attribute(:active, false)
  end

  def next_level
    Level.where(position: self.level.position + 1).first
  end
end
