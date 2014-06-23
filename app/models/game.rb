class Game < ActiveRecord::Base
	has_many :forecasts

	attr_accessible :team1, :team2, :play_at, :score1, :score2, :result, :processed, :round, :processed_excel

	def self.get_games_per_day(date)
		Game.where(play_at: date, processed: false).where.not(score1: nil)
	end

	def self.get_games_per_day_excel(date)
		Game.where(play_at: date, processed_excel: false).where.not(score1: nil)
	end

end
