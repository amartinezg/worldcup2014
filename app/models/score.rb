class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :forecast

	attr_accessible :user_id, :forecast_id, :points, :reason

	def self.calculate_results_per_day(date)

		games = Game.get_games_per_day(date)

		games.each do |game|
			
			Rails.logger.info("#{game["team1"]} vs #{game["team2"]}: #{game["score1"]} - #{game["score2"]}")

			@group = Setup.groups.select{|k,v| v.include?(game["team1"])}.each_key.peek

			@forecasts = game.round <= 15 ? Forecast.all.where(group: "#{@group}") : game.round

			@forecasts.each do |f|
	  		if game.round <= 15
		  		forecast_winner = find_winner(f.forecast1.to_i,f.forecast2.to_i)
		  		result_winner = game.result.to_s

					@points = game["score1"]==f.forecast1 && game["score2"]==f.forecast2 ? 5 : (forecast_winner==result_winner ? 2 : 0)
					@reason = "Partido: #{Setup.teams[game["team1"]]} vs #{Setup.teams[game["team2"]]}. Resultado: #{game["score1"]} - #{game["score2"]}"
				elsif game.round == 19
					@points = Setup.finalists[2]==f.forecast1.to_s ? 10 : 0
					@points += Setup.finalists[3]==f.forecast2.to_s ? 8 : 0
					@reason = "Partido: #{Setup.teams[game["team1"]]} vs #{Setup.teams[game["team2"]]}. Tercero: #{Setup.finalists[2]}. Cuarto: #{Setup.finalists[3]}"
				else
					@points = Setup.finalists[0]==f.forecast1.to_s ? 15 : 0
					@points += Setup.finalists[1]==f.forecast2.to_s ? 12 : 0
					@reason = "Partido: #{Setup.teams[game["team1"]]} vs #{Setup.teams[game["team2"]]}. Campeón: #{Setup.finalists[0]}. SubCampeón: #{Setup.finalists[1]}"
				end

				Rails.logger.info("#{f.user.name}: #{f.forecast1} - #{f.forecast2}. Points: #{@points}")

				Score.create(:user_id => f.user_id, :forecast_id => f.id, :points => @points, 
					:reason => @reason)

				if(game.round == 20 && sum_last_two_matches(f.user_id)==0)
					last_two_forecasts = Forecast.where(group: [19,20], user_id: f.user_id)

					@points = Setup.finalists.include?(last_two_forecasts.first.forecast1) ? 5 : 0
					@points += Setup.finalists.include?(last_two_forecasts.first.forecast2) ? 5 : 0
					@points += Setup.finalists.include?(last_two_forecasts.last.forecast1) ? 5 : 0
					@points += Setup.finalists.include?(last_two_forecasts.last.forecast2) ? 5 : 0

					@reason = "Total puntos obtenidos por Campeón - SubCampeón - 3ro y 4to"

					Score.create(:user_id => f.user_id, :forecast_id => f.id, :points => @points, 
					:reason => @reason)
				end
			end
			game.update(processed: true)
			User.prepare_mail
		end
	end

	def self.find_winner(score1,score2)
		(score1==score2) ? 'D' : ((score1>score2) ? 'L' : 'V')
	end

	def self.grab_sum_per_user(user_id)
		Score.where(user_id: user_id).sum(:points)
	end

	def self.sum_last_two_matches(user)
		Score.where(created_at: (Time.now.midnight - 1.day)..Time.now, user_id: user).sum(:points)
	end
end
