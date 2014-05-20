class CreateSetup < ActiveRecord::Migration
  def change
    create_table :setup do |t|
      t.text :operadores
      t.timestamps  	
    end
  end
end
