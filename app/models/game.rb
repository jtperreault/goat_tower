class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :level
  belongs_to :situation

  before_create :set_starting_level

  validates :player, :level, :player_health, presence: true
  validate  :player_cannot_have_multiple_games_active, on: :create

  def continue
    current_level = next_level
    situation     = current_level.get_situation
    update_attribute(:level, current_level)
    self.player_health = self.player_health + situation.health_change
    self.situation = situation
    save!
    dead_player_check
    last_level_check
  end

  def next_level
    Level.find_by_position(self.level.position + 1)
  end

  def message
    self.situation.description
  end

  private

  def dead_player_check
    if self.player_health <= 0
      end_game
    end
  end

  def last_level_check
    if !next_level
      end_game
    end
  end

  def set_starting_level
    self.level = Level.find_by_position(0)
  end

  def end_game
    update_attribute(:active, false)
  end

  def player_cannot_have_multiple_games_active
    if Game.where(player: self.player).where(active: true).any?
      errors.add(:player, "has an active game")
    end
  end
end
