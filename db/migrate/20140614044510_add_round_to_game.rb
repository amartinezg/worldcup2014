class AddRoundToGame < ActiveRecord::Migration
  def change
  	change_table :games do |t|
      t.integer :round
    end 
  end
end
