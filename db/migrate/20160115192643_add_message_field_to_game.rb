class AddMessageFieldToGame < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.string :message
    end
  end
end
