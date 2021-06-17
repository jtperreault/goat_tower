class AddMessageFieldToGame < ActiveRecord::Migration[5.2]
  def change
    change_table :games do |t|
      t.string :message
    end
  end
end
