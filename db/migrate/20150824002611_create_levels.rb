class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :position, default: 0
      t.string  :description

      t.timestamps null: false
    end
  end
end
