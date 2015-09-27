class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player, index: true, foreign_key: true
      t.references :level,  index: true, foreign_key: true
      t.boolean    :active, default: true
      t.integer    :player_health, default: 100

      t.timestamps null: false
    end
  end
end
