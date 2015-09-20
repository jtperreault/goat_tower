class Level < ActiveRecord::Base
  validates_presence_of :position
  validates_uniqueness_of :position

  # TODO refactor
  def next
    l = Level.where(position: self.position + 1)
    return l.first
  end
end
