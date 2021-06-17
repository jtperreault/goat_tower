class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :handle

      t.timestamps null: false
    end
  end
end
