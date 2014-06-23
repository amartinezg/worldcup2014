class AddProcessedExcelToGame < ActiveRecord::Migration
  def change
    add_column :games, :processed_excel, :boolean
  end
end
