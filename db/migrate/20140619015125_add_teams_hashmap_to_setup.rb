class AddTeamsHashmapToSetup < ActiveRecord::Migration
  def change
    change_table :setup do |t|
      t.text :teams
    end  	
  end
end
