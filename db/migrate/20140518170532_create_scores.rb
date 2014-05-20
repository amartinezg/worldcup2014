class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :points
      t.string :reason
      t.integer :user_id
      t.integer :forecast_id

      t.timestamps
    end
  end
end
