class AddSituationToGame < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.references :situation, index: true, foreign_key: true
    end
  end
end
