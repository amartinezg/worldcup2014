class AddGameIdToForecast < ActiveRecord::Migration
  def change
    add_column :forecasts, :game_id, :integer
  end
end
