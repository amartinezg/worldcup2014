class ResultsController < ApplicationController

  def index
  	@results = User.users_results
  end

end
