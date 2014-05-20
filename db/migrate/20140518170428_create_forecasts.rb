class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :group
      t.string :forecast1
      t.string :forecast2
      t.integer :user_id

      t.timestamps
    end
  end
end
