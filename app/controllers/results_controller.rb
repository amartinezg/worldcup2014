class ResultsController < ApplicationController

  def index
  	@results = User.all.sort_by(&:score_sum).reverse.reject{|u| u.forecasts.where(game_id:nil).size==0}
  end

  def excel
	@results = User.all.sort_by(&:score_sum2).reverse.reject{|u| u.forecasts.where.not(game_id:nil).size==0}
  end
end
