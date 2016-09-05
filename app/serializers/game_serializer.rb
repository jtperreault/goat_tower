class GameSerializer < ActiveModel::Serializer
  attributes :id, :active, :player_health, :message, :level_description, :level_position

  has_one :level
end
