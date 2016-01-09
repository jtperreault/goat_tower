class GameSerializer < ActiveModel::Serializer
  attributes :id, :level, :active, :player_health, :situation, :message
end
