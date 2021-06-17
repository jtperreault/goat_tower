class Player < ApplicationRecord
  has_many :games

  validates_presence_of :handle

  def commands
    if games.where(active: true).any?
      ['continue', 'status', 'end']
    else
      ['start', 'history']
    end
  end
end
