class Game < ApplicationRecord
  belongs_to :player
  belongs_to :level
  belongs_to :situation

  before_validation :set_starting_level, on: :create

  validates :player, :level, :player_health, presence: true
  validate  :player_cannot_have_multiple_games_active, on: :create

  delegate :description, to: :level, prefix: true
  delegate :position,    to: :level, prefix: true

  def continue
    apply_situation(next_level.get_situation)
    update_attribute(:level, next_level)
    last_level_check
  end

  def next_level
    Level.find_by_position(level.position + 1)
  end

  def apply_situation(situation)
    self.situation = situation
    self.player_health = player_health + situation.health_change
    save!
    set_message(situation.description)
    dead_player_check
  end

  private

  def dead_player_check
    if player_health <= 0
      set_message(message << " You have died.")
      end_game
    end
  end

  def set_message(message)
    update_attribute(:message, message)
  end

  def last_level_check
    if !next_level && player_health > 0
      set_message(message.insert(0, "You have ascended to the top of the Goat Tower. ") << " You win!")
      end_game
    end
  end

  def set_starting_level
    level = Level.find_by_position(0)
    situation = level.get_situation
    self.level = level
    self.situation = situation
    self.message = situation.description
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
