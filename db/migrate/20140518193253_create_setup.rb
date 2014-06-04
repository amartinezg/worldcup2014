class CreateSetup < ActiveRecord::Migration
  def change
    create_table :setup do |t|
      t.text :groups
      t.timestamps  	
    end
  end
  def down
    drop_table :setup
  end
end
