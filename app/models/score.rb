class Score < ActiveRecord::Base
	belongs_to :user
	belongs_to :forecast

  def self.calculate_results_per_day
  	response = HTTParty.get('http://footballdb.herokuapp.com/api/v1/event/world.2014/round/5')

  	response.to_hash["games"].each { |game| 
  		game["score1"] = rand(4).to_i
		game["score2"] = rand(4).to_i

		Rails.logger.info("*************************************************")

  		@group = Setup.groups.select{|k,v| v.include?(game["team1_code"])}.each_key.peek

  		Rails.logger.info("Grupo elegido: #{@group}")
  		@forecasts = Forecast.all.where(group: "#{@group}")


  		Rails.logger.info("Group: #{@group} -> Team 1: #{game["team1_title"]} Team 2: #{game["team2_title"]}. Result: #{game["score1"]} - #{game["score2"]}")

  		Rails.logger.info("----------------------------------------------")
  		@forecasts.each do |f|
  			Rails.logger.info("#{f.user.name}: #{f.forecast1} - #{f.forecast2}")

  			@points = game["score1"]==f.forecast1.to_i && game["score2"]==f.forecast2.to_i ? 5 : game["score1"]==f.forecast2.to_i && game["score2"]==f.forecast1.to_i ? 2 : 0

  			@score = Score.new
  			@score.user_id = f.user_id
  			@score.points = @points
  			@score.reason = "Points got for match #{game["team1_title"]} vs #{game["team2_title"]} #{@points}"
  			@score.save
		end
		 Rails.logger.info("----------------------------------------------")
  	} 
    Rails.logger.info("----------Testing Crono #{Time.now}--------------")
  end
end
