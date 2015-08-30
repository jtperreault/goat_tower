class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :level
end
