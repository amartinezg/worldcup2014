class ResultsController < ApplicationController

  def index
  	@results = User.all.sort_by(&:score_sum).reverse
  end

end
