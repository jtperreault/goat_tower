class GameSerializer < ActiveModel::Serializer
  attributes :id, :active, :player_health, :message

  has_one :level, :situation
end
