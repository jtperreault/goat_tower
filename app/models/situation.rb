class Situation < ApplicationRecord
  belongs_to :level

  validates :level, :description, :health_change, presence: true
end
