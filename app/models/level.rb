class Level < ActiveRecord::Base
  validates_presence_of :position
  validates_uniqueness_of :position
end
