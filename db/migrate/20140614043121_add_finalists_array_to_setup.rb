class AddFinalistsArrayToSetup < ActiveRecord::Migration
  def change
    change_table :setup do |t|
      t.text :finalists
    end 
  end
end
