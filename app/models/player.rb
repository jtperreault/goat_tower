class Player < ActiveRecord::Base
  has_many :games

  validates_presence_of :handle
end
