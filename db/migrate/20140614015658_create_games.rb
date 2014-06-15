class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :team1, limit: 3
      t.string :team2, limit: 3
      t.date :play_at
      t.string :score1, limit: 1
      t.string :score2, limit: 1
      t.string :result, limit: 1
      t.boolean :processed

      t.timestamps
    end
  end
end
