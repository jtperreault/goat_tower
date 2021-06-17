class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.references :level, index: true, foreign_key: true
      t.string :description
      t.integer :health_change

      t.timestamps null: false
    end
  end
end
