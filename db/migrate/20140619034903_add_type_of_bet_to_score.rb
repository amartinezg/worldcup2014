class AddTypeOfBetToScore < ActiveRecord::Migration
  def change
    add_column :scores, :type_of_bet, :integer
  end
end
