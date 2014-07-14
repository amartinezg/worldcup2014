class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :forecast

	attr_accessible :user_id, :forecast_id, :points, :reason, :type_of_bet

	def self.calculate_results_per_day(date)

		games = Game.get_games_per_day(date)

		games.each do |game|
			
			Rails.logger.info("#{game["team1"]} vs #{game["team2"]}: #{game["score1"]} - #{game["score2"]}")

			@group = Setup.groups.select{|k,v| v.include?(game["team1"])}.each_key.peek

			@forecasts = game.round <= 15 ? Forecast.all.where(group: "#{@group}", game_id: nil) : game.round

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
					:reason => @reason, :type_of_bet => 1)

				if(game.round == 20 && 	(self.sum_last_two_matches(f.user))==0)
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
			User.prepare_mail(true)
		end
	end

	def self.calculate_finalists
		@finalists = Setup.finalists
		@forecasts = Forecast.where(group: ["19","20"])

		@forecasts.each do |f|
			@points = 0
			if((@finalists.include?(f.forecast1))||(@finalists.include?(f.forecast2)))
				index = @finalists.index(f.forecast1)
				index2 = @finalists.index(f.forecast2)

				if(index==2 && f.group == "19")
					@points += 10
					@reason = "Puntos por acertar 3er lugar."
				elsif(index2==3 && f.group == "19")
					@points += 8
					@reason = "Puntos por acertar 4to lugar."
				elsif(index==0 && f.group == "20")
					@points += 15
					@reason = "Puntos por acertar campeón."
				elsif(index2==1 && f.group == "20")
					@points += 12
					@reason = "Puntos por acertar SubCampeón"
				else
					@points += 5 unless index.nil?
					@points += 5 unless index2.nil?
					@reason = "Total puntos porque #{Setup.teams[f.forecast1]} o #{Setup.teams[f.forecast2]} están en los primeros 4 lugares."
				end
			end
			Rails.logger.info("Usuario: #{f.user.name}. Index: #{index} - Index2: #{index2}. Points: #{@points}")

			if(@points==0)
				@reason = "No obtuviste puntos con #{Setup.teams[f.forecast1]} o #{Setup.teams[f.forecast2]} en los primeros 4 lugares."
			end

			Score.create(:user_id => f.user_id, :forecast_id => f.id, :points => @points, :reason => @reason, :type_of_bet => 1)
		end
	end

	def self.calculate_results_per_day_excel(date)
		games = Game.get_games_per_day_excel(date)
		games.each do |game|
			Rails.logger.info("#{game["team1"]} vs #{game["team2"]}: #{game["score1"]} - #{game["score2"]}")
			p "#{game["team1"]} vs #{game["team2"]}: #{game["score1"]} - #{game["score2"]}"

			@forecasts = Forecast.all.where(game_id: "#{game.id}")

			@forecasts.each do |f|
				forecast_winner = find_winner(f.forecast1.to_i,f.forecast2.to_i)
		  	result_winner = game.result.to_s

		  	@points = game["score1"]==f.forecast1 && game["score2"]==f.forecast2 ? 5 : (forecast_winner==result_winner ? 2 : 0)

				@reason = "Partido: #{Setup.teams[game["team1"]]} vs #{Setup.teams[game["team2"]]}. Resultado: #{game["score1"]} - #{game["score2"]}"
		  	
		  	Score.create(:user_id => f.user_id, :forecast_id => f.id, :points => @points, 
					:reason => @reason, :type_of_bet => 2)
			end
			game.update(processed_excel: true)
			User.prepare_mail(false)
		end
	end

	def self.find_winner(score1,score2)
		(score1==score2) ? 'D' : ((score1>score2) ? 'L' : 'V')
	end

	def self.grab_sum_per_user(user_id,type_of_bet)
		Score.where(user_id: user_id).where(:type_of_bet => type_of_bet).sum(:points)
	end

	def self.sum_last_two_matches(user)
		Score.where(created_at: (Time.now.midnight - 1.day)..Time.now, user_id: user).sum(:points)
	end
end