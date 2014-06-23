class Forecast < ActiveRecord::Base
	has_many :scores
	belongs_to :user
	belongs_to :game

	attr_accessible :user_id, :group, :forecast1, :forecast2, :game_id
end
