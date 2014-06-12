class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :forecast

  def self.calculate_results_per_day
  	response = HTTParty.get('http://footballdb.herokuapp.com/api/v1/event/world.2014/round/9')

	Rails.logger.info("----------------------------------------------")
	logger.debug "----------------------------------------------"
  	@round = response.to_hash["round"]["pos"]
  	if(@round<=15||@round==19||@round==20)
	  	response.to_hash["games"].each { |game| 
	  		game["score1"] = @round<=15 ? rand(4).to_i : Setup.first.groups[Array.new(1){[*'A'..'H'].sample}.join][rand(4).to_i]
			game["score2"] = @round<=15 ? rand(4).to_i : Setup.first.groups[Array.new(1){[*'A'..'H'].sample}.join][rand(4).to_i]

			if @round<=15
	  			@group = Setup.groups.select{|k,v| v.include?(game["team1_code"])}.each_key.peek
	  		elsif @round==19
	  			@group = "19"
	  		else
	  			@group = "20"
	  		end

	  		

	  		logger.debug "Grupo elegido: #{@group}"
	  		@forecasts = Forecast.all.where(group: "#{@group}")

	  		logger.debug "Group: #{@group} -> Team 1: #{game["team1_title"]} Team 2: #{game["team2_title"]}. Result: #{game["score1"]} - #{game["score2"]}"

	  		Rails.logger.info("----------------------------------------------")
	  		@forecasts.each do |f|
	  			Rails.logger.info("#{f.user.name}: #{f.forecast1} - #{f.forecast2}")

	  		  	if @round<=15
	  				@points = game["score1"]==f.forecast1.to_i && game["score2"]==f.forecast2.to_i ? 5 : game["score1"]==f.forecast2.to_i && game["score2"]==f.forecast1.to_i ? 2 : 0
	  			elsif @round==19
	  				@points = game["score1"]==f.forecast1.to_s && game["score2"]==f.forecast2.to_s ? 18 : game["score1"]==f.forecast1.to_s ? 10 : game["score2"]==f.forecast2.to_s ? 8 : 0
	  			else
	  				@points = game["score1"]==f.forecast1.to_s && game["score2"]==f.forecast2.to_s ? 27 : game["score1"]==f.forecast1.to_s ? 15 : game["score2"]==f.forecast2.to_s ? 12 : 0
	  			end

	  			@score = Score.new
	  			@score.user_id = f.user_id
	  			@score.forecast_id = f.id
	  			@score.points = @points
	  			@score.reason = "Points got for match #{game["team1_title"]} vs #{game["team2_title"]}: #{@points}."
	  			@score.save
			end
	  	}
	    Rails.logger.info("----------Testing Crono #{Time.now}--------------")
	  end
	end

	if(@round==20)
		Forecast.where(group: [19,20]).order("user_id").in_groups_of(2) do |forecast|
			forecast.each do |f|
				teams << f.forecast1 << f.forecast2 if f.scores.first.points == 0
			end

			if(teams.size==4) 
				
			end
		end
	end

	def self.grab_sum_per_user(user_id)
		Score.where(user_id: user_id).sum(:points)
	end
end
