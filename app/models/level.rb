class Level < ApplicationRecord
  validates_presence_of :position
  validates_uniqueness_of :position

  has_many :situations

  def get_situation
    situations.order("RANDOM()").first
  end
end
