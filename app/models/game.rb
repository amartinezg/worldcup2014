class Game < ActiveRecord::Base
	attr_accessible :team1, :team2, :play_at, :score1, :score2, :result, :processed, :round

	def self.get_games_per_day(date)
		Game.where(play_at: date, processed: false).where.not(score1: nil)
	end

end
