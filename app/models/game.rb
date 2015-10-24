class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :level

  validates :player, :level, :player_health, presence: true
  validate  :player_cannot_have_multiple_games_active

  def player_cannot_have_multiple_games_active
    if Game.where(player: self.player).where(active: true).any?
      errors.add(:player, "has an active game")
    end
  end

  def continue
    # select next level
    # select situation from level
    # apply situation to game
    # save
  end

  def end_game
    update_attribute(:active, false)
  end

  def next_level
    Level.where(position: self.level.position + 1).first
  end
end
